class AddQuestionTypeIdToDecisionPoint < ActiveRecord::Migration
  def change
    add_column :decision_points, :question_type_id, :integer
  end
end
