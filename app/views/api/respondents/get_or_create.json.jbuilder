json.respondent_id @respondent.id
json.session_id @respondent.session_id
json.current_node_id @respondent.current_node_id
json.seen_nodes @seen_nodes.pluck(:node_id)
json.variables do
  json.flight_code @respondent.flight_code
  json.picking_up_number @respondent.picking_up_number
  json.luggage_count @respondent.luggage_count
  json.luggage_type @respondent.luggage_type
  json.traffic_level @respondent.traffic_level
  json.original_who_picking_up @respondent.original_who_picking_up
  json.originating_city @respondent.originating_location
  json.originating_airport_code @respondent.originating_airport_code
  json.landing_time @respondent.landing_time
  json.flight_time_remaining @respondent.flight_time_remaining
  json.time_elapsed @respondent.time_elapsed
  json.times_circled @respondent.times_circled
end
