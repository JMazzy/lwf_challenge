class ShippingAddress < ActiveRecord::Base
  belongs_to :customer
  belongs_to :address

  validates :customer_id, presence: true
  validates :address_id, presence: true

  validates :address_id, uniqueness: { scope: :customer_id }

  def self.create_from_file(file)
    contents = File.readlines(file).map { |line| line.strip.split(",") }
    contents.shift

    contents.each do |line|
      customer = Customer.find_or_create_by( first_name: line[0], last_name: line[1] )
      address = Address.find_or_create_by( address: line[2], city: line[3], state: line[4], zip: line[5] )

      if !!customer.id && !!address.id
        ShippingAddress.create( customer_id: customer.id, address_id: address.id )
      else
        return false
      end
    end
    true
  end
end
