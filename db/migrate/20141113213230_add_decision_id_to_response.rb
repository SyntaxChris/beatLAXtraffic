class AddDecisionIdToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :decision_id, :integer
  end
end
