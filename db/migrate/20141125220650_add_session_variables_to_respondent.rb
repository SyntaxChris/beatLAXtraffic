class AddSessionVariablesToRespondent < ActiveRecord::Migration
  def change
    remove_column :respondents, :unique_identifier, :string
    add_column :respondents, :session_id, :string
    add_column :respondents, :flight_time_remaining, :integer
    add_column :respondents, :time_elapsed, :integer
    add_column :respondents, :current_node_id, :integer
    add_column :respondents, :flight_code, :string
    add_column :respondents, :passenger_count, :integer
    add_column :respondents, :luggage_count, :integer
    add_column :respondents, :who_picking_up, :string
  end
end
