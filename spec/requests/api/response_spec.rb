require 'rails_helper'

describe "responses API" do
  describe "create" do
    it "records a survey response for a respondent" do
    # "node_id"
    # "respondent_id"
    # "freeform_answer"
    # "answer_id"
    # "decision_id"
    # "times_seen",       default: 1
    # "time_remaining"
    # "seen"
    # "skipped"
    # "rank"
    # "user_interaction"
      params = {
        is_decision: nil,
        node_id: nil,
        respondent_id: nil,
        answers: [
          { answer_id: nil,
            rank: nil
          }
        ],
        decision_id: nil,
        time_remaining: nil
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
