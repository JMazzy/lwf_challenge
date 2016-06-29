class ShippingAddressesController < ApplicationController

  def index
    @shipping_addresses = ShippingAddress.all
  end

  def new
  end

  def create
    file_data = params["address_file"]
    file = file_data.tempfile

    if ShippingAddress.create_from_file( file )
      flash[:notice] = "Addresses imported from file!"
      redirect_to :shipping_addresses
    else
      flash[:alert] = "There are problems with the uploaded file. Please fix them and try again."
      render :new
    end
  end

end
