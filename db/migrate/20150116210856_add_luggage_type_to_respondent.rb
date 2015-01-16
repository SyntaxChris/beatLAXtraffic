class AddLuggageTypeToRespondent < ActiveRecord::Migration
  def change
    add_column :respondents, :luggage_type, :string
  end
end
