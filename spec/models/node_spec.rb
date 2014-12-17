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
    let(:any_node) { FactoryGirl.build(:node)}
    let(:decision_point_node) { FactoryGirl.build(:node) }
    let(:question_node) { FactoryGirl.build(:node) }

    it "can have a question" do
      expect(question_node).to have_one(:question)
    end

    it "can have a decision_point" do
      expect(decision_point_node).to have_one(:decision_point)
    end

    it "has many incoming decisions" do
      expect(any_node).to have_many(:incoming_decisions)
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
      let!(:destination_node) {
        create(:node, is_decision_point: false, nickname: "you found me")
      }
      let!(:decision_1) {
        create(:decision, decision_point_id: decision_point.id, decision: "this way")
      }
      let!(:decision_2) {
        create(:decision, decision_point_id: decision_point.id, decision: "that way", destination_node_id: destination_node.id)
      }

      it "gets all nodes and their associated question/decision data" do
        all_nodes = Node.all_with_content
        q_node = all_nodes.first
        d_node = all_nodes.second

        expect(q_node.question.question).to eq "what?"
        expect(q_node.question.answers.count).to eq 3
        expect(q_node.question.answers.first.answer).to eq "this"

        expect(d_node.decision_point.situation).to eq "where to?"
        expect(d_node.decision_point.decisions.count).to eq 2
        expect(d_node.decision_point.decisions.first.decision).to eq "this way"
        expect(d_node.decision_point.decisions.second.destination_node.nickname).to eq "you found me"
        expect(destination_node.incoming_decisions.first.decision).to eq "that way"
      end
    end
  end
end
