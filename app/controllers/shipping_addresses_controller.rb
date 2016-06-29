class ShippingAddressesController < ApplicationController

  def index
    @shipping_addresses = ShippingAddress.includes(:customer, :address).order("customers.last_name").paginate( page: params[:page], per_page: 25 )
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
