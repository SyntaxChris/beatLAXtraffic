class AddNodeIdToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :node_id, :integer
  end
end
