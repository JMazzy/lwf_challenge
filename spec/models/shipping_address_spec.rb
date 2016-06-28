require "rails_helper"

describe ShippingAddress do
  context "correct parameters" do
    it "is valid"
    it "changes number of addresses in database on save"
  end

  context "incorrect parameters" do
    it "is invalid if missing customer id"
    it "is invalid if missing address id"
    it "does not change number of addresses in database on save"
  end

  describe "create from csv file" do
    context "no errors in file" do
      it "returns true"
      it "changes number of addresses in the database"
    end

    context "errors in file" do
      it "returns false"
      it "does not change the number of addresses in the database"
    end
  end
end
