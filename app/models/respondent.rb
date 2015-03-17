class Respondent < ActiveRecord::Base
  FLIGHT_NUMBERS = *(100..999)
  TIME_TILL_LANDS = [15, 30, 45, 60]
  LUGGAGE_TYPES = ["Carry-on bag", "Large suitcase"]
  ORIGINATING_LOCATIONS = [
    { code: "JFK", city: "New York"},
    { code: "DFW", city: "Dallas" },
    { code: "ORD", city: "Orlando"},
    { code: "HNL", city: "Chicago"},
    { code: "MEX", city: "Mexico City"},
    { code: "YVR", city: "Vancouver"},
    { code: "HKG", city: "Hong Kong"},
    { code: "LHR", city: "London"},
    { code: "SYD", city: "Sydney"}
  ]
  PICKUP_TARGETS = ["Friend", "Coworker", "Parent"]
  TRAFFIC_LEVELS = ["slow", "medium", "fast"]

  has_many :responses
  has_many :seen_nodes
  after_create :set_starting_node
  after_create :set_variables

  def self.get_or_create_by_session(searched_session_id)
    respondent = Respondent.find_by_session_id(searched_session_id) ||
      Respondent.create(session_id: searched_session_id)

    seen_nodes = respondent.seen_nodes

    return { respondent: respondent, seen_nodes: seen_nodes }
  end

  def update_node_history(response_params)
    self.seen_nodes.create(node_id: response_params[:node_id])

    next_node_id = response_params[:next_node_id]
    if self.seen_nodes.pluck(:node_id).include?(next_node_id)
      if response_params[:decision_id].present? # a decision point
        next_node_id = find_id_of_next_unseen_or_decision_point(next_node_id)
      else # an already seen question
        next_node_id = find_id_of_next_unseen_or_decision_point
      end
    else
      # a new question
      next_node_id = response_params[:next_node_id]
    end

    self.update(current_node_id: next_node_id)
  end

  def find_id_of_next_unseen_or_decision_point(dp_next = nil)
    all_nodes = Node.all

    start = all_nodes.find(current_node_id)
    # if already on a decision point, start at the next node,
    # or else you never step off the starting node :)
    if start.is_decision_point?
      start = all_nodes.find(dp_next)
    end

    return walk_nodes_until_unseen_or_dp(all_nodes, start).id
  end

  def walk_nodes_until_unseen_or_dp(all_nodes, this_node)
    if this_node.is_decision_point? || !seen_nodes.pluck(:node_id).include?(this_node.id)
      return this_node
    else
      next_node = all_nodes.find(this_node.next_node_id)
      walk_nodes_until_unseen_or_dp(all_nodes, next_node)
    end
  end

  def mark_as_corrupted!
    self.update(experienced_error: true)
  end

  private

  def set_starting_node
    # I think this way would be better and result in fewer database calls:
    # self.update(current_node_id: Node::STARTING_NODE.id)
    # but testing it is proving difficult and I am taking that as a red flag
    #  - vinney
    self.update(current_node_id: Node.find_by_template_name('splash').id)
  end

  def set_variables
    self.flight_code = FLIGHT_NUMBERS.sample
    self.luggage_count = [1,2,3].sample
    self.luggage_type = LUGGAGE_TYPES.sample
    self.traffic_level = TRAFFIC_LEVELS.sample
    self.picking_up_number = [1,2].sample
    self.originating_airport_code = ORIGINATING_LOCATIONS.sample[:code]
    self.originating_location = ORIGINATING_LOCATIONS.find do |location|
      location[:code] == self.originating_airport_code
    end[:city]
    self.original_who_picking_up = Respondent.evenly_distributed_pickup_target
    self.travel_companion = [true,false].sample
    self.landing_time = TIME_TILL_LANDS.sample
    self.flight_time_remaining = self.landing_time
    self.times_circled = 0
    self.time_elapsed = 0
    self.save
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

    # get single minimum, to be used later
    winner = results.min_by{|k,v| v}

    # get the NUMBER of the minimum count
    minimum = results.values.sort.min

    # if there are more than one of the minimums...
    if results.values.count{|n| n == minimum} > 1
      # get the ties and give back a random one of them
      ties = results.select{|name, count| count == minimum}
      return ties.keys.sample
    else
      # otherwise, use the single minimum from before
      return winner.first
    end
  end

end
