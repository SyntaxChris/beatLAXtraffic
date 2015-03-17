class AddExperiencedErrorToRespondent < ActiveRecord::Migration
  def change
    add_column :respondents, :experienced_error, :boolean, default: false
  end
end
