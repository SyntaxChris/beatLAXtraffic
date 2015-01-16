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
    self.luggage_count = [1,2,3].sample
    self.luggage_type = LUGGAGE_TYPES.sample
    self.picking_up_number = [1,2,3].sample
    self.originating_location = ORIGINATING_LOCATIONS.sample
    self.original_who_picking_up = Respondent.evenly_distributed_pickup_target
    self.travel_companion = [true,false].sample
    self.landing_time = TIME_TILL_LANDS.sample
  end

  def self.evenly_distributed_pickup_target
    all = Respondent.all
    parent = all.where(original_who_picking_up: "Parent")
    friend = all.where(original_who_picking_up: "Friend")
    coworker = all.where(original_who_picking_up: "Coworker")

    results = {
      "Parent" => parent.count,
      "Friend" => friend.count,
      "Coworker" => coworker.count
    }
    winner = results.min_by{|k,v| v}
    minimum = results.values.sort.min

    if results.values.count{|n| n == minimum} > 1
      ties = results.select{|name, count| count == minimum}
      return ties.keys.sample
    else
      return winner.first
    end
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

