require 'rails_helper'

RSpec.describe Decision, :type => :model do
  describe "Attributes" do
  end

  describe "Associations" do
    let(:decision) {FactoryGirl.build(:decision) }

    it "belongs to a decision point" do
      expect(decision).to belong_to(:decision_point)
    end
  end
end
