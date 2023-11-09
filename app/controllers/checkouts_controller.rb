class CheckoutsController < ApplicationController
    TRANSACTION_SUCCESS_STATUSES = [
      Braintree::Transaction::Status::Authorizing,
      Braintree::Transaction::Status::Authorized,
      Braintree::Transaction::Status::Settled,
      Braintree::Transaction::Status::SettlementConfirmed,
      Braintree::Transaction::Status::SettlementPending,
      Braintree::Transaction::Status::Settling,
      Braintree::Transaction::Status::SubmittedForSettlement,
    ]
  
    def new
      @client_token = gateway.client_token.generate
      @amount = params[:amount]
    end
  
    def show
      @transaction = gateway.transaction.find(params[:id])
      @result = _create_result_hash(@transaction)
    end
  
    def create
      amount = params["amount"] # In production you should not take amounts directly from clients
      nonce = params["payment_method_nonce"]
  
      result = gateway.transaction.sale(
        amount: amount,
        payment_method_nonce: nonce,
        :options => {
          :submit_for_settlement => true
        }
      )
  
      if result.success? || result.transaction
        redirect_to checkout_path(result.transaction.id)
      else
        error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
        flash[:error] = error_messages
        redirect_to new_checkout_path
      end
    end
  
    def _create_result_hash(transaction)
      status = transaction.status
  
      if TRANSACTION_SUCCESS_STATUSES.include? status
        result_hash = {
          :header => "Sweet Success!",
          :icon => "success",
          :message => "Your test transaction has been successfully processed. See the Braintree API response and try again."
        }
      else
        result_hash = {
          :header => "Transaction Failed",
          :icon => "fail",
          :message => "Your test transaction has a status of #{status}. See the Braintree API response and try again."
        }
      end
    end
  
    def gateway
        @gateway ||= Braintree::Gateway.new(
            :environment => :sandbox,
            :merchant_id => 'nv9d29j77xq62wbz',
            :public_key => '9v9cr292z489bp5x',
            :private_key => '2ae72c2011da582a7771f4ea9c0b7bc9',
            )
    end
  
    # def gateway
  
    #   @gateway ||= Braintree::Gateway.new(
    #     :environment => :sandbox,
    #     :merchant_id => 'Rails.application.credentials.dig(:braintree, :merchant_id)',
    #     :public_key => 'Rails.application.credentials.dig(:braintree, :public_key)',
    #     :private_key => 'Rails.application.credentials.dig(:braintree, :private_key)',
    #   )
    # end
  end