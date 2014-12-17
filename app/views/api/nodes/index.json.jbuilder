json.array! @nodes do |node|
  json.node_id node.id
  json.is_decision_point node.is_decision_point

  if node.is_decision_point
    json.situation node.decision_point.situation
    json.decisions node.decision_point.decisions.each do |decision|
      json.decision decision.decision
      json.destination_node_id decision.destination_node.id
    end
  elsif !node.is_decision_point
    json.question node.question.question
    json.answers node.question.answers.each do |answer|
      json.answer answer.answer
    end
  else
    nil
  end

end
