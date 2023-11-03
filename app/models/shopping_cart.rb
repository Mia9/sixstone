class ShoppingCart < ApplicationRecord
	acts_as_shopping_cart

	def taxes
		0
	end

	def shipping_cost
		Money.new(1000)
	end
end
