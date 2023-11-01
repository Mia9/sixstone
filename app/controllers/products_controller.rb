class ProductsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.create(product_params)
		if @product.save
			redirect_to products_path(@products)
		else
			render :new
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])	
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		if @product.save
			redirect_to product_path(@product)
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to root_path
	end

	def product_params
		params.require(:product).permit(:name, :category, :description, :price, :quantity, photos: [])
	end
end