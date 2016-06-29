class Address < ActiveRecord::Base
  has_many :shipping_addresses
  has_many :customers, through: :shipping_addresses

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  validates :address, uniqueness: { scope: [:city,:state,:zip] }
end
