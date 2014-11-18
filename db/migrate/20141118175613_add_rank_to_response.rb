class AddRankToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :rank, :integer
  end
end
