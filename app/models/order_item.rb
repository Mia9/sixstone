class OrderItem < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :product, optional: true
	belongs_to :cart, optional: true

	def total
		product.price * quantity
	end
end
