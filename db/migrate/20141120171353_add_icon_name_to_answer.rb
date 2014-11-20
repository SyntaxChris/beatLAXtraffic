class AddIconNameToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :icon_name, :string
  end
end
