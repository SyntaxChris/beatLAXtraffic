class UpdateTimesCircledSpentNodes < ActiveRecord::Migration
  def change

    circled = Node.find_by_nickname("times_circled")
    if circled
      circled.question.update(question: "How many times do you typically circle around LAX when picking up somebody?")
      circled.question.answers.each { |a| a.update(answer: "user specifies") }
    end

    spent = Node.find_by_nickname("time_spent")
    if spent
      spent.question.update(question: "How long does it typically take for you to pick up your passenger once you're at LAX?")
      spent.question.answers.each { |a| a.update(answer: "user specifies") }
    end

  end
end
