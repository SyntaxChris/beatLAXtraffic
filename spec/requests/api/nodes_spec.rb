require 'rails_helper'

describe "nodes API" do

  describe "all nodes" do
    let!(:q1) { create(:question_node) }
    let!(:q2) { create(:question_node) }
    let!(:q3) { create(:question_node) }
    let!(:dp1) { create(:decision_node) }

    #it "gets all nodes" do
    #  get '/api/nodes'

    #  expect(response).to be_success
    #  expect(json.length).to eq 4
    #end

    it "all question nodes have their questions and answers" do
      q1.question = create(:question, node_id: q1.id, question: "what?")
      a1 = create(:answer, question_id: q1.question.id, answer: "this")
      a2 = create(:answer, question_id: q1.question.id, answer: "that")

      q2.question = create(:question, node_id: q2.id, question: "what again?")
      a3 = create(:answer, question_id: q2.question.id, answer: "this again")
      a4 = create(:answer, question_id: q2.question.id, answer: "that again")

      q3.question = create(:question, node_id: q3.id, question: "what yet again?")
      a5 = create(:answer, question_id: q3.question.id, answer: "this yet again")
      a6 = create(:answer, question_id: q3.question.id, answer: "that yet again")

      dp1.decision_point = create(:decision_point, node_id: dp1.id, situation: "where to?")
      d1 = create(:decision, decision_point_id: dp1.decision_point.id, decision: "this way!", destination_node: q3)
      d2 = create(:decision, decision_point_id: dp1.decision_point.id, decision: "that way!", destination_node: q2)

      get '/api/nodes'

      expect(json.first["question"]).to eq "what?"
      expect(json.first["answers"]).to be_a(Array)
      expect(json.first["answers"].first["answer"]).to eq "this"
      expect(json.second["situation"]).to eq "where to?"
      expect(json.second["decisions"]).to be_a(Array)
      expect(json.second["decisions"].first["decision"]).to eq "this way!"
      expect(json.second["decisions"].first["destination_node_id"]).to eq 3
    end
  end

  # describe "a single node's content" do
  #     let!(:question_node) { create(:node, is_decision_point: false) }
  #     let!(:question) { create(:question, node_id: question_node.id, question: 'what?')}
  #     let!(:answer_1) { create(:answer, question_id: question.id, answer: "this")}
  #     let!(:answer_2) { create(:answer, question_id: question.id, answer: "that")}
  #     let!(:answer_3) { create(:answer, question_id: question.id, answer: "the other thing")}
  #     let!(:decision_node) { create(:node, is_decision_point: true) }
  #     let!(:decision_point) {
  #       create(:decision_point, node_id: decision_node.id, situation: "where to?")
  #     }
  #     let!(:decision_1) {
  #       create(:decision, decision_point_id: decision_point.id, decision: "this way")
  #     }
  #     let!(:decision_2) {
  #       create(:decision, decision_point_id: decision_point.id, decision: "that way")
  #     }

  #   it "can get its node's question and answer content" do
  #     get "/api/nodes/#{question_node.id}"

  #     expect(response).to be_success
  #     expect(json['is_decision_point']).to eq false
  #     expect(json['question']).to eq 'what?'
  #   end
  # end
end
