class DecisionPoint < ActiveRecord::Base
  belongs_to :node
  belongs_to :question_type
  has_many :decisions
end
