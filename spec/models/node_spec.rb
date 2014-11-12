require 'rails_helper'

describe Node do
  describe "Attributes" do
    let(:node) {
      FactoryGirl.build(
        :node,
        nickname: "E1",
        is_decision_point: false
      )
    }

    it "has a nickname" do
      expect(node.nickname).to eq "E1"
    end

    it "can be a decision point or not" do
      expect(node.is_decision_point).to eq false
    end
  end

  describe "Associations" do
    let(:decision_point_node) { FactoryGirl.build(:node) }
    let(:question_node) { FactoryGirl.build(:node) }

    it "can have a question" do
      expect(question_node).to have_one(:question)
    end

    it "can have a decision_point" do
      expect(decision_point_node).to have_one(:decision_point)
    end

    it "belongs to a branch" do
      expect(question_node).to belong_to(:branch)
    end

    it "has many responses" do
      expect(question_node).to have_many(:responses)
      expect(decision_point_node).to have_many(:responses)
    end
  end
end
