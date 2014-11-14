class AddNicknameToDecisionPoint < ActiveRecord::Migration
  def change
    add_column :decision_points, :nickname, :string
  end
end
