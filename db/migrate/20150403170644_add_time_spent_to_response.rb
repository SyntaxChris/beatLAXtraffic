class AddTimeSpentToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :time_spent, :integer
  end
end
