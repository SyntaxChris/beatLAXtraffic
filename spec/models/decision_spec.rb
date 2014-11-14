require 'rails_helper'

RSpec.describe Decision, :type => :model do
  describe "Attributes" do
    let(:decision) {
      FactoryGirl.create(
        :decision,
        decision: "I choose option A"
      )
    }

    it "has a 'decision' text content" do
      expect(decision.decision).to eq "I choose option A"
    end

  end

  describe "Associations" do
    let(:decision) {FactoryGirl.build(:decision) }

    it "belongs to a decision point" do
      expect(decision).to belong_to(:decision_point)
    end

    it "has a destination node associated with it" do
      expect(decision).to have_one(:node)
    end
  end
end
