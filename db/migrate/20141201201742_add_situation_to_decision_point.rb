class AddSituationToDecisionPoint < ActiveRecord::Migration
  def change
    add_column :decision_points, :situation, :text
  end
end
