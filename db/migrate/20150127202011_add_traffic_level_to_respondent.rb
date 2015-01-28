class AddTrafficLevelToRespondent < ActiveRecord::Migration
  def change
    add_column :respondents, :traffic_level, :string
  end
end
