class CreateUniqueUsers < ActiveRecord::Migration
  def change
    create_table :unique_users do |t|

      t.timestamps
    end
  end
end
