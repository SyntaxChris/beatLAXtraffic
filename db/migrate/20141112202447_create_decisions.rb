class CreateDecisions < ActiveRecord::Migration
  def change
    create_table :decisions do |t|

      t.timestamps
    end
  end
end
