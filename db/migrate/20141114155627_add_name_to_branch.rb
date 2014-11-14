class AddNameToBranch < ActiveRecord::Migration
  def change
    add_column :branches, :name, :string
  end
end
