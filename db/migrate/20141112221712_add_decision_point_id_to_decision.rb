class AddDecisionPointIdToDecision < ActiveRecord::Migration
  def change
    add_column :decisions, :decision_point_id, :integer
  end
end
