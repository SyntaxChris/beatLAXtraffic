class AddBranchIdToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :branch_id, :integer
  end
end
