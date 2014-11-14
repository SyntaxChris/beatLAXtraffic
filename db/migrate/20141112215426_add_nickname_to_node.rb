class AddNicknameToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :nickname, :string
  end
end
