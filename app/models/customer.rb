class Customer < ActiveRecord::Base
  has_many :shipping_addresses
  has_many :addresses, through: :shipping_addresses

  validates :first_name, presence: true
  validates :last_name, presence: true
end
