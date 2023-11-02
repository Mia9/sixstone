class OrderItem < ApplicationRecord	
	belongs_to :order
	belongs_to :orderable, polymorphic: true
	
	def total
		self.quantity * self.item.price
	end
end
