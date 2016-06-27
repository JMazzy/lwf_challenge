class ShippingAddressesController < ApplicationController

  def index
    @shipping_addresses = ShippingAddress.all
  end

  def new
  end

end
