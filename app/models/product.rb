class Product < ApplicationRecord
	belongs_to :user

	CATEGORIES = %w[keychain bracelet necklace earrings]
end
