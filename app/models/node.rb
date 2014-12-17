class Node < ActiveRecord::Base
  has_one :question
  has_one :decision_point
  has_many :responses
  has_many :incoming_decisions, foreign_key: 'node_id', class_name: "Decision"
  belongs_to :branch
  # belongs_to :decision

  def Node.all_with_content
    all_nodes = Node
      .includes(
        { question: :answers },
        { decision_point: { decisions: :destination_node } }
      )
  end
end
