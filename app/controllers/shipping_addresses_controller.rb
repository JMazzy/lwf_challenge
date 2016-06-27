class ShippingAddressesController < ApplicationController

  def index
    @shipping_addresses = ShippingAddress.all
  end

  def new
  end

  def create
    file_data = params["address_file"]

    ShippingAddress.create_from_file( file_data.tempfile,
                                      file_data.original_filename )

    redirect_to :shipping_addresses
  end

end
