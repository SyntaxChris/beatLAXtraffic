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
    let!(:decision) { FactoryGirl.create(:decision) }
    let!(:destination_node) { create(:node, decision_id: decision.id) }

    it "belongs to a decision point" do
      expect(decision).to belong_to(:decision_point)
    end

    it "has a destination node associated with it" do
      expect(decision).to have_one(:destination_node)
    end

    it "has a destination node called 'destination_node'" do
      expect(decision.destination_node).to be_a(Node)
    end
  end
end
