require 'rails_helper'

describe "respondents API" do
  let!(:starting_node) { FactoryGirl.create(:node, template_name: 'sq-2-2') }
  describe "find_or_create respondent" do
    context "when a resopndent is new" do
      it "returns an new respondent's id, session id and random variables" do
        existing = create(:respondent)
        existing.update(
          flight_code: "123",
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
        expect(json['variables']['flight_code']).to eq new_respondent.flight_code.to_i
        expect(json['variables']['originating_city']).to eq new_respondent.originating_location
        expect(json['variables']['originating_airport_code']).to eq new_respondent.originating_airport_code
        expect(json['variables']['traffic_level']).to eq new_respondent.traffic_level
        expect(json['variables']['picking_up_number']).to eq new_respondent.picking_up_number
        expect(json['variables']['luggage_count']).to eq new_respondent.luggage_count
        expect(json['variables']['luggage_type']).to eq new_respondent.luggage_type
        expect(json['variables']['original_who_picking_up']).to eq new_respondent.original_who_picking_up
        expect(json['variables']['landing_time']).to eq new_respondent.landing_time
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
        expect(json['variables']['flight_code']).to eq existing.flight_code.to_s
        expect(json['variables']['originating_city']).to eq existing.originating_location
        expect(json['variables']['originating_airport_code']).to eq existing.originating_airport_code
        expect(json['variables']['traffic_level']).to eq existing.traffic_level
        expect(json['variables']['picking_up_number']).to eq existing.picking_up_number
        expect(json['variables']['luggage_count']).to eq existing.luggage_count
        expect(json['variables']['luggage_type']).to eq existing.luggage_type
        expect(json['variables']['original_who_picking_up']).to eq existing.original_who_picking_up
        expect(json['variables']['landing_time']).to eq existing.landing_time
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
  describe "update" do
    let!(:respondent) { create(:respondent, session_id: "123abc") }
    it "finds a respondent by session id" do
      cookies["survey_session_id"] = respondent.session_id
      patch '/api/respondents/update'
      expect(assigns(:respondent)).to eq respondent
    end
    it "updates the respondent's elapsed_time" do
      params = { time_elapsed: 20 }
      cookies["survey_session_id"] = respondent.session_id
      patch '/api/respondents/update', params

      expect(Respondent.last.time_elapsed).to eq 20
    end
    it "updates the respondent's flight_time_remaining" do
      params = { flight_time_remaining: 45 }
      cookies["survey_session_id"] = respondent.session_id
      patch '/api/respondents/update', params

      expect(Respondent.last.flight_time_remaining).to eq 45
    end
  end
end
