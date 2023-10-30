class ApplicationController < ActionController::Base

	before_action :current_cart

	helper_method :admin?
    def admin?
      current_user && current_user.role == "admin"
    end

	private
		def current_cart
			if session[:cart_id]
		        cart = Cart.find_by(:id => session[:cart_id])
		        if cart.present?
		          @current_cart = cart
		        else
		          session[:cart_id] = nil
		        end
		    end

		    if session[:cart_id] == nil
		        @current_cart = Cart.create
		        session[:cart_id] = @current_cart.id
		    end
		end
end
