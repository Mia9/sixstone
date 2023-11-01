class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  has_many :orders
  has_many :products, through: :orders
  has_many :products, through: :cart
  has_many :products, dependent: :destroy
  
  enum role: [:customer, :admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :customer
  end  
end
