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
      params = {
        response: {
          is_decision: false,
          respondent_id: respondent.id,
          node_id: node.id,
          decision_id: nil,
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
      }
      xhr :post, '/api/response', params

      expect(response).to be_success
    end

    it "is ok with an empty answers array" do
      Response.create(node_id: node.id, answer_id: answer.id, respondent_id: 123)
      Response.create(node_id: node.id, answer_id: answer.id, respondent_id: respondent.id)
      params = {
        response: {
          is_decision: false,
          respondent_id: respondent.id,
          node_id: node.id,
          decision_id: nil,
          answers: [],
          time_remaining: nil
        }
      }
      xhr :post, '/api/response', params

      expect(response).to be_success
    end

    pending "is ok with a nil answers array" do
      Response.create(node_id: node.id, answer_id: answer.id, respondent_id: 123)
      Response.create(node_id: node.id, answer_id: answer.id, respondent_id: respondent.id)
      params = {
        response: {
          is_decision: false,
          respondent_id: respondent.id,
          node_id: node.id,
          decision_id: nil,
          answers: nil,
          time_remaining: nil
        }
      }
      xhr :post, '/api/response', params

      expect(response).to be_success
    end

    it "fails without necessary information" do
      Response.create(node_id: node.id, answer_id: answer.id, respondent_id: 123)
      Response.create(node_id: node.id, answer_id: answer.id, respondent_id: respondent.id)
      params = {
        response: {
          is_decision: false,
          respondent_id: nil,
          node_id: node.id,
          decision_id: nil,
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
      }
      xhr :post, '/api/response', params

      expect(response).not_to be_success
    end

    it "records a decision point response for a respondent" do
      skip "test this too"
    end
  end
end
