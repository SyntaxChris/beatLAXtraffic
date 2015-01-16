class Respondent < ActiveRecord::Base
  FLIGHT_NUMBERS = *(100..999)
  TIME_TILL_LANDS = [15, 30, 45, 60]
  LUGGAGE_TYPES = ["Carry-on bag", "Large suitcase"]
  ORIGINATING_LOCATIONS = ["JFK", "DFW", "ORD", "HNL", "MEX", "YVR", "HKG", "LHR", "SYD"]
  PICKUP_TARGETS = ["Friend", "Coworker", "Parent"]

  has_many :responses
  after_create :set_starting_node
  after_create :set_variables

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

  def set_variables
    self.flight_code = FLIGHT_NUMBERS.sample
  end
end

# flight number: xxx - should be any INT between 100 - 999
# airport codes:
# - JFK (New York City)
# - DFW (Dallas)
# - ORD (Chicago)
# - HNL (Honolulu)
# - MEX (Mexico City)
# - YVR (Vancouver)
# - HKG (Hong Kong)
# - LHR (London)
# - SYD (Sydney)
# passenger number: 1,2,3
# passenger type: pending
# luggage_count: 1,2,3
# luggage_type:
# - Carry-on bag
# - Large Suitcase
# FRIENDS, COWORKERS, PARENTS

