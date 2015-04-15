class AddUniqueUserIdToRespondent < ActiveRecord::Migration
  def change
    add_column :respondents, :unique_user_id, :integer
  end
end
