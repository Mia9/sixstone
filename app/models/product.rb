class Product < ApplicationRecord
	has_many :order_items, as: :orderable
	has_many_attached :photos

	CATEGORIES = %w[keychain bracelet necklace earrings]

	
end
