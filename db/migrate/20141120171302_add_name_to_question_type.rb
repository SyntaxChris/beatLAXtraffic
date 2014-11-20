class AddNameToQuestionType < ActiveRecord::Migration
  def change
    add_column :question_types, :name, :string
  end
end
