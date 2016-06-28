require "rails_helper"

describe Customer do
  context "correct parameters" do
    it "is valid"
    it "changes number of customers in database on save"
  end

  context "incorrect parameters" do
    it "is invalid missing first name"
    it "is invalid missing last name"
    it "does not change number of customers in database on save"
  end
end
