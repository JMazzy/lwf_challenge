require "rails_helper"

describe Address do
  let( :address ) { Address.new( address: "123 Test Lane", city: "Anytown", state: "NY", zip: "12345" ) }

  context "correct parameters" do
    it "is valid" do
      expect( address ).to be_valid
    end
    it "changes number of addresses in database on save" do
      expect{ address.save }.to change{ Address.count }.by(1)
    end
  end

  context "incorrect parameters" do

    it "is invalid if missing street address" do
      address.address = nil
      expect( address ).to_not be_valid
    end

    it "is invalid if missing city" do
      address.city = nil
      expect( address ).to_not be_valid
    end

    it "is invalid if missing state" do
      address.state = nil
      expect( address ).to_not be_valid
    end

    it "is invalid if missing zip" do
      address.zip = nil
      expect( address ).to_not be_valid
    end

    it "does not change number of addresses in database on save" do
      address.zip = nil
      expect{ address.save }.to change{ Address.count }.by(0)
    end
  end
end
