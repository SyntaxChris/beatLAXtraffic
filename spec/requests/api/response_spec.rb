require 'rails_helper'

describe "responses API" do
  describe "create" do
    let!(:respondent) { create(:respondent) }
    let!(:node) { create(:node) }
    let!(:answer) { create(:answer) }
    let!(:answer_2) { create(:answer) }
    let!(:answer_3) { create(:answer) }
    let!(:answer_4) { create(:answer) }

    it "records a survey response for a respondent" do
      Response.create(node_id: node.id, answer_id: answer.id, respondent_id: 123)
      Response.create(node_id: node.id, answer_id: answer.id, respondent_id: respondent.id)
      argument_params = {
      }
      params = {
        response: {
          is_decision: false,
          respondent_id: respondent.id,
          node_id: node.id,
          decision_id: nil,
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
      }
      post '/api/response', params, format: :json

      expect(response).to be_success
      # record a single response for a respondent
      # if it's successfully saved, update the current_node for the respondent
      # send back that current_node to the front end for proper loading
    end

    it "records a decision point response for a respondent" do
      pending
    end
  end
end
