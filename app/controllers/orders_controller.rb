class OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
		@order = Order.new
	end

	def edit
		@order = Order.find(params[:id])
	end

	def create
		@order = current_user.orders.create(order_params)
		if @order.save
      	   extract_items_from_cart

      	   @shopping_cart.clear
           redirect_to order_path(@order), notice: 'Order was successfully created.'
        else
           render :new, notice: 'Order failed.'
        end	
	end

	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
			redirect_to order_path(@order)
		else
			render :edit
		end
	end

	private
    def order_params
      	params.require(:order).permit(:name, :phone, :email, :address, :town, :postcode, :subtotal, :shipping_cost, :total, :paid, :status)
    end

    def extract_items_from_cart
      	@shopping_cart.shopping_cart_items.each do |item|
        		@order.order_items.create(orderable_type: item.item.class, orderable_id: item.item_id, price: item.price, quantity: item.quantity, subtotal: item.subtotal)
      	end
    end
end