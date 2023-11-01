class OrderItem < ApplicationRecord
	
	belongs_to :order

	def total
		self.quantity * self.item.price
	end
end
