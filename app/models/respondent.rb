class Respondent < ActiveRecord::Base
  has_many :responses

  def self.get_or_create_by_session(searched_session_id)
    respondent = Respondent.find_by_session_id(searched_session_id) ||
      Respondent.create(session_id: searched_session_id)

    result = {
      session_id: respondent.session_id,
      respondent_id: respondent.id
    }

    return result
  end
end
