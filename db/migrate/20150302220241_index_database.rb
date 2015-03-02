class IndexDatabase < ActiveRecord::Migration
  def change
    add_index :answers, :question_id
    add_index :decision_points, :node_id
    add_index :decision_points, :question_type_id
    add_index :decisions, :decision_point_id
    add_index :decisions, :destination_node_id
    add_index :freeform_responses, :response_id
    add_index :nodes, :branch_id
    add_index :nodes, :decision_id
    add_index :questions, :node_id
    add_index :questions, :question_type_id
    add_index :responses, :node_id
    add_index :responses, :respondent_id
    add_index :responses, :answer_id
    add_index :responses, :decision_id
  end
end
