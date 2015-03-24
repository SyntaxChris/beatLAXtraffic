class AddFirstPathChosenToRespondent < ActiveRecord::Migration
  def change
    add_column :respondents, :first_path_chosen, :string
  end
end
