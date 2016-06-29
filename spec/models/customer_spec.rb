require "rails_helper"

describe Customer do

  let(:customer) { Customer.new( first_name: "First", last_name: "Last" ) }

  context "correct parameters" do

    it "is valid" do
      expect( customer ).to be_valid
    end

    it "changes number of customers in database on save" do
      expect{ customer.save }.to change{ Customer.count }.by(1)
    end
  end

  context "incorrect parameters" do

    it "is invalid missing first name" do
      customer.first_name = nil
      expect( customer ).to_not be_valid
    end

    it "is invalid missing last name" do
      customer.last_name = nil
      expect( customer ).to_not be_valid
    end

    it "does not change number of customers in database on save" do
      customer.first_name = nil
      expect{ customer.save }.to change{ Customer.count }.by(0)
    end

  end

end
