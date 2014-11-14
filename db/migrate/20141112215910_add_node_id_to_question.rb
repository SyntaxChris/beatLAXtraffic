class AddNodeIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :node_id, :integer
  end
end
