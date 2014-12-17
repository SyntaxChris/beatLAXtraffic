FactoryGirl.define do
  factory :node do

    factory :question_node do
      is_decision_point false
    end

    factory :decision_node do
      is_decision_point true
    end

  end
end
