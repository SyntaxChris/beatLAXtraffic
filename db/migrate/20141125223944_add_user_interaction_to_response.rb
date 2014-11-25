class AddUserInteractionToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :user_interaction, :integer
  end
end
