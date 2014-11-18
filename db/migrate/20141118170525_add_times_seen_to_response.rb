class AddTimesSeenToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :times_seen, :integer, default: 1
  end
end
