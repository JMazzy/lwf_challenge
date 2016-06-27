class ShippingAddress < ActiveRecord::Base
  belongs_to :customer
  belongs_to :address

  validates :customer_id, presence: true
  validates :address_id, presence: true
end
