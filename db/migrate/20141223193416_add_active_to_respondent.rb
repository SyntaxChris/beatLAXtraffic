class AddActiveToRespondent < ActiveRecord::Migration
  def change
    add_column :respondents, :active, :boolean
  end
end
