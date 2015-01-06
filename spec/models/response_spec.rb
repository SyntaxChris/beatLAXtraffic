require 'rails_helper'

RSpec.describe Response, :type => :model do
  describe "Attributes" do
    let(:response) { FactoryGirl.build(:response) }

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

    it "can have a rank, for multiple select questions" do
      response.rank = 3
      expect(response.rank).to eq 3
    end

    it "has a user interaction numerical representation" do
      response.user_interaction = -1
      expect(response.user_interaction).to eq -1
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

    it "can have a freeform response" do
      expect(response).to have_one(:freeform_response)
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
        respondent_id: 1,
        answer_id: answer_a.id
      )
      response_2 = FactoryGirl.create(
        :response,
        node_id: node_1.id,
        respondent_id: 1,
        answer_id: answer_b.id
      )
      response_3 = FactoryGirl.create(
        :response,
        node_id: node_1.id,
        respondent_id: 1,
        answer_id: answer_c.id
      )

      question_ids_from_responses = [response_1, response_2, response_3].collect do |response|
        response.node.question.id
      end

      expect(question_ids_from_responses.uniq.size).to eq 1
    end

    it "for ranked answers, there are multiple responses to one question and each "\
       "response has a rank" do

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
      answer_d = FactoryGirl.create(
        :answer,
        question: question_1,
        answer: 'answer d'
      )
      answer_e = FactoryGirl.create(
        :answer,
        question: question_1,
        answer: 'answer e'
      )

      response_1 = FactoryGirl.create(
        :response,
        node_id: node_1.id,
        respondent_id: 1,
        answer_id: answer_a.id,
        rank: 1
      )
      response_2 = FactoryGirl.create(
        :response,
        node_id: node_1.id,
        respondent_id: 1,
        answer_id: answer_b.id,
        rank: 2
      )
      response_3 = FactoryGirl.create(
        :response,
        node_id: node_1.id,
        respondent_id: 1,
        answer_id: answer_c.id,
        rank: 3
      )
      response_4 = FactoryGirl.create(
        :response,
        node_id: node_1.id,
        respondent_id: 1,
        answer_id: answer_d.id,
        rank: 0
      )
      response_5 = FactoryGirl.create(
        :response,
        node_id: node_1.id,
        respondent_id: 1,
        answer_id: answer_d.id,
        rank: 0
      )

      question_ids_from_responses = [
        response_1, response_2, response_3, response_4, response_5
      ].collect do |response|
        response.node.question.id
      end

      expect(question_ids_from_responses.uniq.size).to eq 1
      expect(response_1.rank).to eq 1
      expect(response_5.rank).to eq 0
    end

    it "can belong to a decision" do
      expect(response).to belong_to(:decision)
    end
  end

  describe "Features" do
    describe "create_all_from_node_interaction" do
      context "survey questions" do
        let!(:respondent) { create(:respondent) }
        let!(:node) { create(:node) }
        let!(:answer) { create(:answer) }
        let!(:answer_2) { create(:answer) }
        let!(:answer_3) { create(:answer) }
        let!(:answer_4) { create(:answer) }

        it "creates a question response for a respondent" do
        argument_params = {
          is_decision: false,
          respondent_id: respondent.id,
          node_id: node.id,
          answers: [
            { answer_id: answer.id,
              rank: nil
            }
          ],
          time_elapsed: 10
        }
          response_count = respondent.responses.count
          Response.create_all_from_node_interaction(argument_params)
          expect(respondent.responses.count).to eq response_count + 1
          expect(respondent.responses.last.node_id).to eq node.id
          expect(respondent.responses.last.answer_id).to eq answer.id
        end

        it "decides on times_seen" do
          Response.create(node_id: node.id, answer_id: answer.id, respondent_id: 123)
          Response.create(node_id: node.id, answer_id: answer.id, respondent_id: respondent.id)
          argument_params = {
            is_decision: false,
            respondent_id: respondent.id,
            node_id: node.id,
            answers: [
              { answer_id: answer.id,
                rank: nil
              }
            ],
            time_remaining: nil
          }

          response_count = respondent.responses.count
          Response.create_all_from_node_interaction(argument_params)
          expect(respondent.responses.count).to eq response_count + 1
          expect(respondent.responses.last.node_id).to eq node.id
          expect(respondent.responses.last.answer_id).to eq answer.id
          expect(respondent.responses.last.times_seen).to eq 2
        end

        it "decides if this node was skipped" do
          argument_params = {
            is_decision: false,
            respondent_id: respondent.id,
            node_id: node.id,
            answers: [
            ],
            time_remaining: nil
          }

          response_count = respondent.responses.count
          Response.create_all_from_node_interaction(argument_params)
          expect(respondent.responses.count).to eq response_count + 1
          expect(respondent.responses.last.node_id).to eq node.id
          expect(respondent.responses.last.answer_id).to eq nil
          expect(respondent.responses.last.skipped).to eq true
        end

        it "decides if the node was seen before AND skipped this time" do
          Response.create(node_id: node.id, answer_id: answer.id, respondent_id: 123)
          Response.create(node_id: node.id, answer_id: answer.id, respondent_id: respondent.id)
          argument_params = {
            is_decision: false,
            respondent_id: respondent.id,
            node_id: node.id,
            answers: [
            ],
            time_remaining: nil
          }

          response_count = respondent.responses.count
          Response.create_all_from_node_interaction(argument_params)
          expect(respondent.responses.count).to eq response_count + 1
          expect(respondent.responses.last.node_id).to eq node.id
          expect(respondent.responses.last.answer_id).to eq nil
          expect(respondent.responses.last.skipped).to eq true
          expect(respondent.responses.last.times_seen).to eq 2
        end

        it "creates a separate response for each multiple choice answer" do
          Response.create(node_id: node.id, answer_id: answer.id, respondent_id: 123)
          argument_params = {
            is_decision: false,
            respondent_id: respondent.id,
            node_id: node.id,
            answers: [
              {
                answer_id: answer.id,
                rank: 2
              },
              {
                answer_id: answer_2.id,
                rank: 3
              },
              {
                answer_id: answer_3.id,
                rank: 1
              }
            ],
            time_remaining: nil
          }

          response_count = respondent.responses.count
          Response.create_all_from_node_interaction(argument_params)
          expect(respondent.responses.count).to eq response_count + 3
          expect(respondent.responses.where(answer_id: answer.id).first.rank).to eq 2
          expect(respondent.responses.where(answer_id: answer_2.id).first.rank).to eq 3
          expect(respondent.responses.where(answer_id: answer_3.id).first.rank).to eq 1
        end

        it "creates a separate response for each multiple choice answer AND knows if it has seen his question before" do
          Response.create(node_id: node.id, answer_id: answer.id, respondent_id: 123)
          Response.create(node_id: node.id, answer_id: answer.id, respondent_id: respondent.id)
          argument_params = {
            is_decision: false,
            respondent_id: respondent.id,
            node_id: node.id,
            answers: [
              {
                answer_id: answer.id,
                rank: 2
              },
              {
                answer_id: answer_2.id,
                rank: 3
              },
              {
                answer_id: answer_3.id,
                rank: 1
              }
            ],
            time_remaining: nil
          }

          response_count = respondent.responses.count
          Response.create_all_from_node_interaction(argument_params)
          expect(respondent.responses.count).to eq response_count + 3
          expect(respondent.responses.where(answer_id: answer.id).last.rank).to eq 2
          expect(respondent.responses.where(answer_id: answer.id).last.times_seen).to eq 2
          expect(respondent.responses.where(answer_id: answer_2.id).first.rank).to eq 3
          expect(respondent.responses.where(answer_id: answer_2.id).first.times_seen).to eq 2
          expect(respondent.responses.where(answer_id: answer_3.id).first.rank).to eq 1
          expect(respondent.responses.where(answer_id: answer_3.id).first.times_seen).to eq 2
        end

        it "time elapses with every node traversal" do
          pending "need to add this and have this number: "\
                  "\n\t - add to time elapsed" \
                  "\n\t - subtract from time-till-land"
        end
      end
      context "decision points" do
        let!(:respondent) { create(:respondent) }
        let!(:node) { create(:node) }
        let!(:decision_point) { create(:decision_point) }
        let!(:decision) { create(:decision) }

        it "creates a decision point response for a respondent" do
          argument_params = {
            is_decision: true,
            respondent_id: respondent.id,
            node_id: node.id,
            answers: [
            ],
            decision_id: decision.id,
          }

          response_count = respondent.responses.count
          Response.create_all_from_node_interaction(argument_params)
          expect(respondent.responses.count).to eq response_count + 1
          expect(respondent.responses.last.node_id).to eq node.id
          expect(respondent.responses.last.decision_id).to eq decision.id
          expect(respondent.responses.last.skipped).to eq nil
        end
      end
    end

    pending "checks to see if this user has responded to this node before, "\
             "if so, how many times, and increases times_seen accordingly"

    pending "if this response is a decision point, it logs the amount of time "\
            "remaining, in minutes, when this point is reached"

    pending "if there is no time left at a decision point, it logs '1' as the "\
            "amount of time remaining"

    pending "seen/skipped etc summarize themselves as -1, 0, 1 in 'interaction' field"\
            "seen+answerd = 1, seen+skipped = -1, not seen = 0"

    pending "when a question is NOT skipped, marks the response as not skipped,"\
            "associates the proper answer and notes in the 'interaction'"

    pending "when a question IS skipped, marks the response as skipped and"\
            "deals with 'interaction' field properly"

    pending "at the end of the experience, create a response for each node that "\
            "wasn't encountered and update its 'interaction' field"

    pending "in 'select all that apply' questions, the multiple responses for a single "\
            "question are NOT recorded as multiple visits to the same node"
  end

end
