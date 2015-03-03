class AddCodebookIdentifierToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :codebook_identifier, :integer
  end
end
