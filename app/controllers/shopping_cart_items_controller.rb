class ShoppingCartItemsController < ApplicationController
	def create
		
		@item = Product.find(params[:item_id])
		
		@shopping_cart.add(@item, @item.price)
		redirect_back fallback_location: root_path
	end

	def update
		@item = ShoppingCartItem.find(params[:id])

		@item.update(quantity: params[:quantity])
		redirect_back fallback_location: root_path
	end

	def destroy
		ShoppingCartItem.destroy(params[:id])
		redirect_back fallback_location: root_path
	end
end