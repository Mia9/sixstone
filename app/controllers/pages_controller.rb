class PagesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@products = Product.all
	end
end