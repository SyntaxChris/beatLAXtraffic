class AddFreeformAnswerToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :freeform_answer, :string
  end
end
