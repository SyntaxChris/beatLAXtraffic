class ChangeNodeIdToDestinationNodeIdInDecision < ActiveRecord::Migration
  def change
    rename_column :decisions, :node_id, :destination_node_id
  end
end
