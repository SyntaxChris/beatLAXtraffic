class AddDecisionIdToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :decision_id, :integer
  end
end
