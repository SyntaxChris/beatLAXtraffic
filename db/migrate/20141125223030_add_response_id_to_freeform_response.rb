class AddResponseIdToFreeformResponse < ActiveRecord::Migration
  def change
    add_column :freeform_responses, :response_id, :integer
  end
end
