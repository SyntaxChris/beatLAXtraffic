require 'rails_helper'

RSpec.describe DecisionPoint, :type => :model do
  describe "Attributes" do
    let(:decision_point) {
      FactoryGirl.build(
        :decision_point,
        nickname: "first-decision"
      )
    }

    it "has a nickname" do
      expect(decision_point.nickname).to eq "first-decision"
    end
  end

  describe "Associations" do
    let(:decision_point) { FactoryGirl.build(:decision_point) }

    it "belongs to a node" do
      expect(decision_point).to belong_to(:node)
    end

    it "has many decisions" do
      expect(decision_point).to have_many(:decisions)
    end
  end
end
