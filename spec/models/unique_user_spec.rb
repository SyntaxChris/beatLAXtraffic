require 'rails_helper'

describe UniqueUser do
  let(:unique_user) { FactoryGirl.create(:unique_user) }
  describe "Attributes" do
  end

  describe "Associations" do
    it "has many respondents" do
      expect(unique_user).to have_many(:respondents)
    end
  end
end
