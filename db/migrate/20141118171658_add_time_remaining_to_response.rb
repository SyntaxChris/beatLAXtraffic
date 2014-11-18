class AddTimeRemainingToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :time_remaining, :integer
  end
end
