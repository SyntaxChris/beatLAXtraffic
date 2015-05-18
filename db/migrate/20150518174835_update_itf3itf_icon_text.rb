class UpdateItf3itfIconText < ActiveRecord::Migration
  def change
    n = Node.find_by_nickname("itf1st_depart")
    q = Question.find_by_node_id(n.id)
    a = q.answers.where(icon_name: "computer").first
    if a.answer == "A way to make sure I know the status of my flight."
    else
      a.update(answer: "A way to make sure I know the status of my flight.")
    end
  end
end
