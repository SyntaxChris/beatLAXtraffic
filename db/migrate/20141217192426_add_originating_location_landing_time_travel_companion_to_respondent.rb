class AddOriginatingLocationLandingTimeTravelCompanionToRespondent < ActiveRecord::Migration
  def change
    add_column :respondents, :originating_location, :string
    add_column :respondents, :landing_time, :integer
    add_column :respondents, :travel_companion, :boolean
  end
end
