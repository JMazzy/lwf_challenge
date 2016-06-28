require "rails_helper"

describe Address do
  context "correct parameters" do
    it "is valid"
    it "changes number of addresses in database on save"
  end

  context "incorrect parameters" do
    it "is invalid if missing street address"
    it "is invalid if missing city"
    it "is invalid if missing state"
    it "is invalid if missing zip"
    it "does not change number of addresses in database on save"
  end
end
