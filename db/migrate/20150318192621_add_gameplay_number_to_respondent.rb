class AddGameplayNumberToRespondent < ActiveRecord::Migration
  def change
    add_column :respondents, :gameplay_number, :integer, default: 1
  end
end
