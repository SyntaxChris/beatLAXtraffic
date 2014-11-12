class CreateDecisionPoints < ActiveRecord::Migration
  def change
    create_table :decision_points do |t|

      t.timestamps
    end
  end
end
