class AddBrowserIdentifierToUniqueUser < ActiveRecord::Migration
  def change
    add_column :unique_users, :browser_identifier, :string
  end
end
