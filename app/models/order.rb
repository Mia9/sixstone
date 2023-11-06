class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items, dependent: :destroy

	enum status: %w[received cancelled processing shipped], _default: 'received'

end
