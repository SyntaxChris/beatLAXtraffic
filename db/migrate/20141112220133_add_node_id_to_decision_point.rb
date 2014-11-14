class AddNodeIdToDecisionPoint < ActiveRecord::Migration
  def change
    add_column :decision_points, :node_id, :integer
  end
end
