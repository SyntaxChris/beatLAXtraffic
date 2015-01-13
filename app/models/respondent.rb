class Respondent < ActiveRecord::Base
  has_many :responses
  after_create :set_starting_node

  def self.get_or_create_by_session(searched_session_id)
    respondent = Respondent.find_by_session_id(searched_session_id) ||
      Respondent.create(session_id: searched_session_id)

    result = {
      session_id: respondent.session_id,
      respondent_id: respondent.id,
      current_node_id: respondent.current_node_id
    }

    return result
  end

  private
  def set_starting_node
    self.update(current_node_id: 1)
  end
end
