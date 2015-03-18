require 'rails_helper'

describe UniqueUser do
  let(:unique_user) {
    FactoryGirl.create(
      :unique_user,
      browser_identifier: "123abc"
    )
  }

  describe "Attributes" do
    it "has a browser_identifier" do
      expect(unique_user.browser_identifier).to eq "123abc"
    end
  end

  describe "Associations" do
    it "has many respondents" do
      expect(unique_user).to have_many(:respondents)
    end
  end

  describe "Features" do
    describe "get_or_create" do
    end
  end
end
