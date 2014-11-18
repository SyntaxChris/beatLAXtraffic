require 'rails_helper'

RSpec.describe Response, :type => :model do
  describe "Attributes" do
    let(:response) { FactoryGirl.build(:response) }

    it "can have a freeform answer text" do
      answer = FactoryGirl.build(
        :answer,
        answer: "other"
      )
      response.answer = answer
      response.freeform_answer = "I have other reasons"

      expect(response.freeform_answer).to eq "I have other reasons"
      expect(response.answer.answer).to eq "other"
    end

    it "keeps track of 'times seen' for this session and this node, defaults to 1" do
      expect(response.times_seen).to eq 1
    end

    it "keeps track of 'time remaining', in minutes, for each decision point response" do
      response.time_remaining = 30
      expect(response.time_remaining).to eq 30
    end

    it "tracks when a user skips the question" do
      response.skipped = true
      expect(response.skipped).to eq true
    end

    it "tracks when a user hasn't see a certain node" do
      response.seen = false
      expect(response.seen).to eq false
    end
  end

  describe "Associations" do
    let(:response) { FactoryGirl.build(:response) }

    it "belongs to a respondent" do
      expect(response).to belong_to(:respondent)
    end

    it "belongs to a node" do
      expect(response).to belong_to(:node)
    end

    it "can belong to an answer" do
      expect(response).to belong_to(:answer)
    end

    it "there can be many responses belonging to different answers but the same question "\
       "in the case of 'select all that apply'" do

      node_1 = FactoryGirl.create(:node)
      question_1 = FactoryGirl.create(:question, node_id: node_1.id)
      answer_a = FactoryGirl.create(
        :answer,
        question: question_1,
        answer: 'answer a'
      )
      answer_b = FactoryGirl.create(
        :answer,
        question: question_1,
        answer: 'answer b'
      )
      answer_c = FactoryGirl.create(
        :answer,
        question: question_1,
        answer: 'answer c'
      )

      response_1 = FactoryGirl.create(
        :response,
        node_id: node_1.id,
        answer_id: answer_a.id
      )
      response_2 = FactoryGirl.create(
        :response,
        node_id: node_1.id,
        answer_id: answer_b.id
      )
      response_3 = FactoryGirl.create(
        :response,
        node_id: node_1.id,
        answer_id: answer_c.id
      )

      question_ids_from_responses = [response_1, response_2, response_3].collect do |response|
        response.node.question.id
      end

      expect(question_ids_from_responses.uniq.size).to eq 1
    end

    it "can belong to a decision" do
      expect(response).to belong_to(:decision)
    end
  end

  describe "Features" do
    pending "checks to see if this user has responded to this node before, "\
             "if so, how many times, and increases times_seen accordingly"

    pending "if this response is a decision point, it logs the amount of time "\
            "remaining, in minutes, when this point is reached"

    pending "if there is no time left at a decision point, it logs '1' as the "\
            "amount of time remaining"

    pending "when a question is NOT skipped, marks the response as not skipped and "\
            "associates the proper answer"

    pending "when a question IS skipped, marks the response as skipped and records "\
            "answer of 1"

    pending "at the end of the experience, create a response for each node that "\
            "wasn't encountered and mark it as unseen, with answer of 0, and note "\
            "that it was not skipped"

    pending "in 'select all that apply' questions, the multiple responses for a single "\
            "question are NOT recorded as multiple visits to the same node"
  end

end
