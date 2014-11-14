class ChangeStringsToTextsInMultipleTables < ActiveRecord::Migration
  def up
    change_column :answers, :answer, :text
    change_column :responses, :freeform_answer, :text
  end

  def down
    change_column :answers, :answer, :string
    change_column :responses, :freeform_answer, :string
  end
end
