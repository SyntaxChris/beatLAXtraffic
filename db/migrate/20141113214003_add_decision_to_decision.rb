class AddDecisionToDecision < ActiveRecord::Migration
  def change
    add_column :decisions, :decision, :text
  end
end
