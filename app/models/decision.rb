class Decision < ActiveRecord::Base
  belongs_to :decision_point
  has_one :node
end
