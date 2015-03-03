class AddCodebookIdentifierToDecisions < ActiveRecord::Migration
  def change
    add_column :decisions, :codebook_identifier, :integer
  end
end
