class ProductsController < ApplicationController
	# before_action :authenticate_user!, except: [:index, :show]
	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = current_user.products.create(product_params)
		if @product.save
			redirect_to products_path(@products)
		else
			render :new
		end
	end

	def show
		@product = Product.find(params[:id])
	end


	def product_params
		params.require(:product).permit(:name, :category, :description, :price, :quantity)
	end
end