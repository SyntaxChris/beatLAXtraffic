class AddIsDecisionPointToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :is_decision_point, :boolean
  end
end
