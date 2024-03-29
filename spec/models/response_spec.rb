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
    let!(:starting_node) { FactoryGirl.create(:node, template_name: 'splash') }
    describe "create_all_from_node_interaction" do
      context "survey questions" do
        let!(:respondent) { create(:respondent) }
        let!(:next_node) { create(:node) }
        let!(:node) { create(:node, next_node_id: next_node.id) }
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
            { id: answer.id,
              rank: nil
            }
          ],
          time_elapsed: 10
        }
          response_count = respondent.responses.count
          Response.create_all_from_node_interaction(argument_params, respondent)
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
              { id: answer.id,
                rank: nil
              }
            ],
            time_remaining: nil
          }

          response_count = respondent.responses.count
          Response.create_all_from_node_interaction(argument_params, respondent)
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
          Response.create_all_from_node_interaction(argument_params, respondent)
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
          Response.create_all_from_node_interaction(argument_params, respondent)
          expect(respondent.responses.count).to eq response_count + 1
          expect(respondent.responses.last.node_id).to eq node.id
          expect(respondent.responses.last.answer_id).to eq nil
          expect(respondent.responses.last.skipped).to eq true
          expect(respondent.responses.last.times_seen).to eq 2
        end

        context "when the next_node hasn't been seen" do
          it "updates the respondent's current_node_id to be the next_node" do
            # don't create seen nodes
            #
            argument_params = {
              is_decision: false,
              respondent_id: respondent.id,
              node_id: node.id,
              next_node_id: next_node.id,
              answers: [
                { id: answer.id,
                  rank: nil
              }
              ],
                time_elapsed: 10
            }
            response_count = respondent.responses.count
            Response.create_all_from_node_interaction(argument_params, respondent)
            expect(respondent.responses.count).to eq response_count + 1
            expect(respondent.responses.last.node_id).to eq node.id
            expect(respondent.responses.last.answer_id).to eq answer.id
            expect(Respondent.last.current_node_id).to eq next_node.id
          end
        end

        context "when the next_node has already been seen" do
          let!(:first_dp) { create(:node, is_decision_point: true) }
          let!(:further_node) { create(:node, next_node_id: first_dp.id) }
          let!(:seen_node) { create(:node, next_node_id: further_node.id) }
          let!(:current_node) { create(:node, next_node_id: seen_node.id) }

          it "advances to the next decision point" do
            # create seen nodes
            [seen_node, further_node, first_dp].each do |node|
              respondent.seen_nodes.create(node_id: node.id)
            end
            respondent.update(current_node_id: current_node.id)

            argument_params = {
              is_decision: false,
              respondent_id: respondent.id,
              node_id: current_node.id,
              next_node_id: seen_node.id,
              answers: [
                { id: answer.id,
                  rank: nil
              }
              ],
                time_elapsed: 10
            }

            Response.create_all_from_node_interaction(argument_params, respondent)
            expect(Respondent.last.current_node_id).to eq first_dp.id
          end
          it "advances to the next unseen node" do
            # create seen nodes
            [seen_node, first_dp].each do |node|
              respondent.seen_nodes.create(node_id: node.id)
            end
            respondent.update(current_node_id: current_node.id)

            argument_params = {
              is_decision: false,
              respondent_id: respondent.id,
              node_id: current_node.id,
              next_node_id: seen_node.id,
              answers: [
                { id: answer.id,
                  rank: nil
              }
              ],
                time_elapsed: 10
            }

            Response.create_all_from_node_interaction(argument_params, respondent)
            expect(Respondent.last.current_node_id).to eq further_node.id
          end

          it "advances to the next decision point if already on a decision point!" do
            decision = create(:decision)
            alternate_start = create(:node, is_decision_point: true)
            # create seen nodes
            [seen_node, further_node, first_dp].each do |node|
              respondent.seen_nodes.create(node_id: node.id)
            end
            respondent.update(current_node_id: alternate_start.id)

            argument_params = {
              is_decision: false,
              respondent_id: respondent.id,
              decision_id: decision.id,
              node_id: alternate_start.id,
              next_node_id: seen_node.id,
              answers: [
                { id: answer.id,
                  rank: nil
              }
              ],
                time_elapsed: 10
            }

            Response.create_all_from_node_interaction(argument_params, respondent)
            expect(respondent.current_node_id).to eq first_dp.id
          end
        end

        it "adds the current_node_id to respondent's 'seen nodes'" do
          argument_params = {
            is_decision: false,
            respondent_id: respondent.id,
            node_id: node.id,
            next_node_id: next_node.id,
            answers: [
              { id: answer.id,
                rank: nil
              }
            ],
            time_elapsed: 10
          }

          Response.create_all_from_node_interaction(argument_params, respondent)
          expect(respondent.seen_nodes.pluck(:node_id)).to include(node.id)
        end

        it "updates current_node and adds to seen_nodes for a respondent" do
          argument_params = {
            is_decision: false,
            respondent_id: respondent.id,
            node_id: node.id,
            next_node_id: next_node.id,
            answers: [
              { id: answer.id,
                rank: nil
              }
            ],
            time_elapsed: 10
          }

          Response.create_all_from_node_interaction(argument_params, respondent)
          expect(Respondent.last.seen_nodes.pluck(:node_id)).to include(node.id)
          expect(Respondent.last.current_node_id).to eq next_node.id
        end

        it "creates a separate response for each multiple choice answer" do
          Response.create(node_id: node.id, answer_id: answer.id, respondent_id: 123)
          argument_params = {
            is_decision: false,
            respondent_id: respondent.id,
            node_id: node.id,
            answers: [
              {
                id: answer.id,
                rank: 2
              },
              {
                id: answer_2.id,
                rank: 3
              },
              {
                id: answer_3.id,
                rank: 1
              }
            ],
            time_remaining: nil
          }

          response_count = respondent.responses.count
          Response.create_all_from_node_interaction(argument_params, respondent)
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
                id: answer.id,
                rank: 2
              },
              {
                id: answer_2.id,
                rank: 3
              },
              {
                id: answer_3.id,
                rank: 1
              }
            ],
            time_remaining: nil
          }

          response_count = respondent.responses.count
          Response.create_all_from_node_interaction(argument_params, respondent)
          expect(respondent.responses.count).to eq response_count + 3
          expect(respondent.responses.where(answer_id: answer.id).last.rank).to eq 2
          expect(respondent.responses.where(answer_id: answer.id).last.times_seen).to eq 2
          expect(respondent.responses.where(answer_id: answer_2.id).first.rank).to eq 3
          expect(respondent.responses.where(answer_id: answer_2.id).first.times_seen).to eq 2
          expect(respondent.responses.where(answer_id: answer_3.id).first.rank).to eq 1
          expect(respondent.responses.where(answer_id: answer_3.id).first.times_seen).to eq 2
        end

        pending "time elapses with every node traversal" do
          skip "need to add this and have this number: "\
                  "\n\t - add to time elapsed" \
                  "\n\t - subtract from time-till-land"
        end
      end
      context "decision points" do
        let!(:starting_node) { FactoryGirl.create(:node, template_name: 'splash') }
        let!(:respondent) { create(:respondent) }
        let!(:next_node) { create(:node) }
        let!(:node) { create(:node, next_node_id: next_node.id) }
        let!(:decision_point) { create(:decision_point) }
        let!(:decision) { create(:decision) }

        it "creates a decision point response for a respondent (with empty answers)" do
          argument_params = {
            is_decision: true,
            respondent_id: respondent.id,
            node_id: node.id,
            answers: [
            ],
            decision_id: decision.id,
          }

          response_count = respondent.responses.count
          Response.create_all_from_node_interaction(argument_params, respondent)
          expect(respondent.responses.count).to eq response_count + 1
          expect(respondent.responses.last.node_id).to eq node.id
          expect(respondent.responses.last.decision_id).to eq decision.id
          expect(respondent.responses.last.skipped).to eq nil
        end
        it "creates a decision point response for a respondent (with nil answers)" do
          argument_params = {
            is_decision: true,
            respondent_id: respondent.id,
            node_id: node.id,
            answers: nil,
            decision_id: decision.id,
          }

          response_count = respondent.responses.count
          Response.create_all_from_node_interaction(argument_params, respondent)
          expect(respondent.responses.count).to eq response_count + 1
          expect(respondent.responses.last.node_id).to eq node.id
          expect(respondent.responses.last.decision_id).to eq decision.id
          expect(respondent.responses.last.skipped).to eq nil
        end

        it "updates the respondent's current_node_id to be the next_node" do
          argument_params = {
            is_decision: true,
            respondent_id: respondent.id,
            node_id: node.id,
            answers: nil,
            decision_id: decision.id,
            next_node_id: next_node.id
          }

          response_count = respondent.responses.count
          Response.create_all_from_node_interaction(argument_params, respondent)
          expect(respondent.responses.count).to eq response_count + 1
          expect(respondent.responses.last.node_id).to eq node.id
          expect(respondent.responses.last.decision_id).to eq decision.id
          expect(Respondent.last.current_node_id).to eq next_node.id
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
