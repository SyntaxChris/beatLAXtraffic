class Decision < ActiveRecord::Base
  belongs_to :decision_point
  belongs_to :destination_node, foreign_key: "destination_node_id", class_name: "Node"
end
