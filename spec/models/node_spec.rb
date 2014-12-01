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

  describe "Features" do

    describe "all_with_content" do
      let!(:question_node) { create(:node, is_decision_point: false) }
      let!(:question) { create(:question, node_id: question_node.id, question: 'what?')}
      let!(:answer_1) { create(:answer, question_id: question.id, answer: "this")}
      let!(:answer_2) { create(:answer, question_id: question.id, answer: "that")}
      let!(:answer_3) { create(:answer, question_id: question.id, answer: "the other thing")}
      let!(:decision_node) { create(:node, is_decision_point: true) }
      let!(:decision_point) {
        create(:decision_point, node_id: decision_node.id, situation: "where to?")
      }
      let!(:decision_1) {
        create(:decision, decision_point_id: decision_point.id, decision: "this way")
      }
      let!(:decision_2) {
        create(:decision, decision_point_id: decision_point.id, decision: "that way")
      }
      let!(:destination_node) { create(:node, is_decision_point: false, decision_id: decision_2.id)}

      it "gets all nodes and their associated question/decision data" do
        all_nodes = Node.all_with_content

        binding.pry
        expect(all.first["question"]).to eq "what?"
        expect(all.first["answers"]).to be_a(Array)
        expect(all.first["answers"].first).to eq "this"
      end
    end
  end
end
