class CreateSeenNodes < ActiveRecord::Migration
  def change
    create_table :seen_nodes do |t|
      t.integer :node_id
      t.integer :respondent_id

      t.timestamps
    end
  end
end
