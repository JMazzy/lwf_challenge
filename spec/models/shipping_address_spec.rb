require "rails_helper"

describe ShippingAddress do
  let( :customer ) { instance_double( Customer, id: 1, first_name: "First", last_name: "Last" ) }
  let( :address ) { instance_double( Address, id: 1, address: "123 Test Lane", city: "TestTown", state: "NY", zip: "12345" ) }
  let( :shipping ) { ShippingAddress.new( customer_id: customer.id, address_id: address.id ) }

  context "correct parameters" do

    it "is valid" do
      expect( shipping ).to be_valid
    end

    it "changes number of addresses in database on save" do
      expect{ shipping.save }.to change{ ShippingAddress.count }.by(1)
    end

  end

  context "incorrect parameters" do

    it "is invalid if missing customer id" do
      shipping.customer_id = nil
      expect( shipping ).to_not be_valid
    end

    it "is invalid if missing address id" do
      shipping.customer_id = nil
      expect( shipping ).to_not be_valid
    end

    it "does not change number of addresses in database on save" do
      shipping.customer_id = nil
      expect{ shipping.save }.to change{ ShippingAddress.count }.by(0)
    end

  end

  describe "create from csv file" do

    context "no errors in csv" do

      let( :file ) { "spec/fixtures/files/valid.csv" }

      it "returns true" do
        expect( ShippingAddress.create_from_file( file ) ).to eq true
      end

      it "changes number of addresses in the database" do
        expect{ ShippingAddress.create_from_file( file ) }.to change{ ShippingAddress.count }.by(1)
      end

    end

    context "errors in csv" do

      let( :file ) { "spec/fixtures/files/invalid.csv" }

      it "returns false" do
        expect( ShippingAddress.create_from_file( file ) ).to eq false
      end

      it "does not change the number of addresses in the database" do
        expect{ ShippingAddress.create_from_file( file ) }.to change{ ShippingAddress.count }.by(0)
      end

    end

    context "uploading duplicate data" do
      let( :file ) { "spec/fixtures/files/valid.csv" }

      it "does not duplicate records" do
        expect{ 2.times { ShippingAddress.create_from_file( file ) } }.to change{ ShippingAddress.count }.by(1)
      end
    end

  end

end
