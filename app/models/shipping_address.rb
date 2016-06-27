class ShippingAddress < ActiveRecord::Base
  belongs_to :customer
  belongs_to :address

  validates :customer_id, presence: true
  validates :address_id, presence: true

  def self.create_from_file(file, name)
    contents = File.readlines(file).map { |line| line.strip.split(",") }
    contents.shift

    contents.each do |line|
      customer = Customer.create( first_name: line[0], last_name: line[1] )
      address = Address.create( address: line[2], city: line[3], state: line[4], zip: line[5] )
      ShippingAddress.create( customer_id: customer.id, address_id: address.id )
    end
  end
end
