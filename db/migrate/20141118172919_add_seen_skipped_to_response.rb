class AddSeenSkippedToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :seen, :boolean
    add_column :responses, :skipped, :boolean
  end
end
