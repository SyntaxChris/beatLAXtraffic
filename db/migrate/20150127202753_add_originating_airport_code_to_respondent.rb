class AddOriginatingAirportCodeToRespondent < ActiveRecord::Migration
  def change
    add_column :respondents, :originating_airport_code, :string
  end
end
