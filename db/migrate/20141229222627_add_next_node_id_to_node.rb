class AddNextNodeIdToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :next_node_id, :integer
  end
end
