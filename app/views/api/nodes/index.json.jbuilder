json.array! @nodes do |node|
  json.node_id node.id
  json.is_decision_point node.is_decision_point

  if node.is_decision_point
    json.decision_point do
      json.id node.decision_point.id
      json.situation node.decision_point.situation
    end
    json.decisions node.decision_point.decisions.each do |decision|
      json.id decision.id
      json.decision decision.decision
      json.destination_node_id decision.destination_node.id
    end
  elsif !node.is_decision_point
    json.question do
      json.id node.question.id
      json.question_type node.question.question_type.name
      json.question node.question.question
    end
    json.answers node.question.answers.each do |answer|
       json.id answer.id
       json.answer answer.answer
       if answer.custom_order.present?
         json.custom_order answer.custom_order
       end
    end
    json.next_node_id node.next_node_id
  else
    nil
  end

end
