require 'rails_helper'

describe "respondents API" do
  describe "find_or_create respondent" do
    it "returns an new respondent's id and session id if one didn't exist before" do
      existing = create(:respondent)
      previous_count = Respondent.count
      get '/api/respondents/get_or_create', format: :json

      expect(Respondent.count).to eq previous_count + 1
      new_respondent = Respondent.last
      expect(cookies["survey_session_id"]).to eq new_respondent.session_id
      expect(json['session_id']).to eq new_respondent.session_id
      expect(json['respondent_id']).to eq new_respondent.id
    end

    it "returns an existing respondent's id and session id" do
      existing = create(:respondent, session_id: "10abc")
      previous_count = Respondent.count
      cookies["survey_session_id"] = existing.session_id
      get '/api/respondents/get_or_create', format: :json

      expect(Respondent.count).to eq previous_count
      expect(cookies["survey_session_id"]).to eq existing.session_id
      expect(json['session_id']).to eq existing.session_id
      expect(json['respondent_id']).to eq existing.id
    end
  end
end
