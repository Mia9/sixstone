class ShoppingCartsController < ApplicationController
	def show; end

	def destroy
		@shopping_cart.clear
		redirect_to root_path
	end
end