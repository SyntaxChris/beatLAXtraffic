require 'rails_helper'

describe "respondents API" do
  describe "find_or_create respondent" do
    context "when a resopndent is new" do
      it "returns an new respondent's id, session id and random variables" do
        existing = create(:respondent)
        existing.update(
          flight_code: 1234,
          passenger_count: 1,
          luggage_count: 2,
          original_who_picking_up: 'Boss',
          originating_location: 'MEX'
        )
        previous_count = Respondent.count
        get '/api/respondents/get_or_create', format: :json

        expect(Respondent.count).to eq previous_count + 1
        new_respondent = Respondent.last
        expect(cookies["survey_session_id"]).to eq new_respondent.session_id
        expect(json['session_id']).to eq new_respondent.session_id
        expect(json['respondent_id']).to eq new_respondent.id
        expect(json['flight_code']).to eq new_respondent.flight_code.to_i
        expect(json['passenger_count']).to eq new_respondent.passenger_count
        expect(json['luggage_count']).to eq new_respondent.luggage_count
        expect(json['original_who_picking_up']).to eq new_respondent.original_who_picking_up
        expect(json['originating_location']).to eq new_respondent.originating_location
      end
    end

    context "when a respondent is returning" do
      it "returns an existing respondent's id, session id and random variables" do
        existing = create(:respondent, session_id: "10abc")
        previous_count = Respondent.count
        cookies["survey_session_id"] = existing.session_id
        get '/api/respondents/get_or_create', format: :json

        expect(Respondent.count).to eq previous_count
        expect(cookies["survey_session_id"]).to eq existing.session_id
        expect(json['session_id']).to eq existing.session_id
        expect(json['respondent_id']).to eq existing.id
      end

      it "returns respondent's current_node_id" do
        existing = create(:respondent, session_id: "10abc", current_node_id: 420)
        previous_count = Respondent.count
        cookies["survey_session_id"] = existing.session_id
        get '/api/respondents/get_or_create', format: :json

        expect(Respondent.count).to eq previous_count
        expect(cookies["survey_session_id"]).to eq existing.session_id
        expect(json['session_id']).to eq existing.session_id
        expect(json['respondent_id']).to eq existing.id
        expect(json['current_node_id']).to eq existing.current_node_id
      end
    end
  end
end
