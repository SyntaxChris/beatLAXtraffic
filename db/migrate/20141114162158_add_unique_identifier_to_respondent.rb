class AddUniqueIdentifierToRespondent < ActiveRecord::Migration
  def change
    add_column :respondents, :unique_identifier, :string
  end
end
