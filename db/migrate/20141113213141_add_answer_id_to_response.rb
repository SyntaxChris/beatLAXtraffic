class AddAnswerIdToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :answer_id, :integer
  end
end
