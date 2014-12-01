class Node < ActiveRecord::Base
  has_one :question
  has_one :decision_point
  has_many :responses
  belongs_to :branch
  belongs_to :decision

  def Node.all_with_content
    # all_nodes = Node.includes(:question, {decision_point: :decisions})

  end
end
