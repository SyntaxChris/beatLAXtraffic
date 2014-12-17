class AddNodeIdToDecision < ActiveRecord::Migration
  def change
    add_column :decisions, :node_id, :integer
  end
end
