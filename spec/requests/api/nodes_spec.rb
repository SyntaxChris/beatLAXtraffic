require 'rails_helper'

describe "nodes API" do

  describe "all nodes" do
    let!(:q1) { create(:question_node) }
    let!(:q2) { create(:question_node) }
    let!(:q3) { create(:question_node) }
    let!(:dp1) { create(:decision_node) }

    it "all question nodes have their questions and answers" do
      select_type = create(:question_type, name:"select-one")

      q1.question = create(:question, node_id: q1.id, question: "what?", question_type_id: select_type.id)
      a1 = create(:answer, question_id: q1.question.id, answer: "this")
      a2 = create(:answer, question_id: q1.question.id, answer: "that")

      q2.question = create(:question, node_id: q2.id, question: "what again?", question_type_id: select_type.id)
      a3 = create(:answer, question_id: q2.question.id, answer: "this again")
      a4 = create(:answer, question_id: q2.question.id, answer: "that again")

      q3.question = create(:question, node_id: q3.id, question: "what yet again?", question_type_id: select_type.id)
      a5 = create(:answer, question_id: q3.question.id, answer: "this yet again")
      a6 = create(:answer, question_id: q3.question.id, answer: "that yet again")

      dp1.decision_point = create(:decision_point, node_id: dp1.id, situation: "where to?")
      d1 = create(:decision, decision_point_id: dp1.decision_point.id, decision: "this way!", destination_node: q3)
      d2 = create(:decision, decision_point_id: dp1.decision_point.id, decision: "that way!", destination_node: q2)

      get '/api/nodes'

      expect(json.first["question"]["question"]).to eq "what?"
      expect(json.first["answers"]).to be_a(Array)
      expect(json.first["answers"].first["answer"]).to eq "this"
    end

    it "question nodes also have a next node to go to next" do
      select_type = create(:question_type, name:"select-one")
      q1.update(next_node_id: 5)
      q1.question = create(:question, node_id: q1.id, question: "what?", question_type_id: select_type.id)
      a1 = create(:answer, question_id: q1.question.id, answer: "this")
      a2 = create(:answer, question_id: q1.question.id, answer: "that")

      q2.question = create(:question, node_id: q2.id, question: "what again?", question_type_id: select_type.id)
      a3 = create(:answer, question_id: q2.question.id, answer: "this again")
      a4 = create(:answer, question_id: q2.question.id, answer: "that again")

      q3.question = create(:question, node_id: q3.id, question: "what yet again?", question_type_id: select_type.id)
      a5 = create(:answer, question_id: q3.question.id, answer: "this yet again")
      a6 = create(:answer, question_id: q3.question.id, answer: "that yet again")

      dp1.decision_point = create(:decision_point, node_id: dp1.id, situation: "where to?")
      d1 = create(:decision, decision_point_id: dp1.decision_point.id, decision: "this way!", destination_node: q3)
      d2 = create(:decision, decision_point_id: dp1.decision_point.id, decision: "that way!", destination_node: q2)

      get '/api/nodes'

      nexty_node = json.select{|n| n["node_id"] == q1.id}.first
      expect(nexty_node["next_node_id"]).to eq 5
    end

    it "question nodes have a question_type" do
      select_type = create(:question_type, name:"select-one")
      q1.question = create(:question, node_id: q1.id, question: "what?", question_type_id: select_type.id)
      q1.question.update(question_type_id: select_type.id)
      a1 = create(:answer, question_id: q1.question.id, answer: "this")
      a2 = create(:answer, question_id: q1.question.id, answer: "that")

      q2.question = create(:question, node_id: q2.id, question: "what again?", question_type_id: select_type.id)
      a3 = create(:answer, question_id: q2.question.id, answer: "this again")
      a4 = create(:answer, question_id: q2.question.id, answer: "that again")

      q3.question = create(:question, node_id: q3.id, question: "what yet again?", question_type_id: select_type.id)
      a5 = create(:answer, question_id: q3.question.id, answer: "this yet again")
      a6 = create(:answer, question_id: q3.question.id, answer: "that yet again")

      dp1.decision_point = create(:decision_point, node_id: dp1.id, situation: "where to?")
      d1 = create(:decision, decision_point_id: dp1.decision_point.id, decision: "this way!", destination_node: q3)
      d2 = create(:decision, decision_point_id: dp1.decision_point.id, decision: "that way!", destination_node: q2)

      get '/api/nodes'

      type_node = json.select{|n| n["node_id"] == q1.id}.first
      expect(type_node["question"]["question_type"]).to eq "select-one"
    end

    it "all decision points have their situations and decisions" do
      select_type = create(:question_type, name:"select-one")
      q1.question = create(:question, node_id: q1.id, question: "what?", question_type_id: select_type.id)
      a1 = create(:answer, question_id: q1.question.id, answer: "this")
      a2 = create(:answer, question_id: q1.question.id, answer: "that")

      q2.question = create(:question, node_id: q2.id, question: "what again?", question_type_id: select_type.id)
      a3 = create(:answer, question_id: q2.question.id, answer: "this again")
      a4 = create(:answer, question_id: q2.question.id, answer: "that again")

      q3.question = create(:question, node_id: q3.id, question: "what yet again?", question_type_id: select_type.id)
      a5 = create(:answer, question_id: q3.question.id, answer: "this yet again")
      a6 = create(:answer, question_id: q3.question.id, answer: "that yet again")

      dp1.decision_point = create(:decision_point, node_id: dp1.id, situation: "where to?")
      d1 = create(:decision, decision_point_id: dp1.decision_point.id, decision: "this way!", destination_node: q3)
      d2 = create(:decision, decision_point_id: dp1.decision_point.id, decision: "that way!", destination_node: q2)

      get '/api/nodes'

      dp_index = nil
      json.each_with_index { |j,i| dp_index = i if j['is_decision_point'] == true }

      expect(json[dp_index]['decision_point']['situation']).to eq "where to?"
      expect(json[dp_index]["decisions"]).to be_a(Array)
      expect(json[dp_index]["decisions"].first["decision"]).to eq "this way!"
      expect(json[dp_index]["decisions"].first["destination_node_id"]).to eq q3.id
    end
  end
end
