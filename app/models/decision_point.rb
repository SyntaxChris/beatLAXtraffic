class DecisionPoint < ActiveRecord::Base
  belongs_to :node
  has_many :decisions
end
