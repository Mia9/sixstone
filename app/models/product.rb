class Product < ApplicationRecord
	belongs_to :user
	has_many_attached :photos

	CATEGORIES = %w[keychain bracelet necklace earrings]
end
