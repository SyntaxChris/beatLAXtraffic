class AddRespondentIdToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :respondent_id, :integer
  end
end
