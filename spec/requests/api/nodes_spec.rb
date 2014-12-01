require 'rails_helper'

describe "nodes API" do

  describe "all nodes" do
    let!(:q1) { create(:question_node) }
    let!(:q2) { create(:question_node) }
    let!(:q3) { create(:question_node) }
    let!(:d1) { create(:decision_node) }

    it "gets all nodes" do
      get '/api/nodes'

      expect(response).to be_success
      expect(json.length).to eq 4
      expect(json.first["id"]).to eq q1.id
    end

    it "all question nodes have their questions and answers" do
      q1.question = create(:question, question: "what?")
      get '/api/nodes'

      expect(json.first["question"]).to eq "what?"
      expect(json.first["answers"]).to be_a(Array)
      expect(json.first["answers"].first).to eq "this"
    end
  end

  describe "a node's content" do
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

    it "can get its node's question and answer content" do
      get "/api/nodes/#{question_node.id}"

      expect(response).to be_success
      expect(json['is_decision_point']).to eq false
      expect(json['question']).to eq 'what?'
    end
  end
end
