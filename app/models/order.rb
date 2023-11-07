class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items, dependent: :destroy
	validates :name, presence: true
	validates :phone, presence: true
	validates :email, presence: true
	validates :address, presence: true
	validates :town, presence: true
	validates :postcode, presence: true

	enum status: %w[received cancelled processing shipped], _default: 'received'
end