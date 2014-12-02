class Decision < ActiveRecord::Base
  belongs_to :decision_point
  has_one :destination_node, foreign_key: 'decision_id', class_name: "Node"
end
