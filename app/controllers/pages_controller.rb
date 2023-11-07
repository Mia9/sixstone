class PagesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show, :aboutus, :contact]
	def index
		@products = Product.all	
	end

	def aboutus	
	end

	def contact		
	end
end