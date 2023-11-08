class ApplicationController < ActionController::Base
	before_action :authenticate_user!
  before_action :extract_shopping_cart
  protect_from_forgery with: :exception

	helper_method :admin?
    def admin?
      current_user && current_user.role == "admin"
    end

  private
  def extract_shopping_cart
  	shopping_cart_id = session[:shopping_cart_id]

  	@shopping_cart = session[:shopping_cart_id] ? ShoppingCart.find(shopping_cart_id) : ShoppingCart.create
  	session[:shopping_cart_id] = @shopping_cart.id
  end
	
end
