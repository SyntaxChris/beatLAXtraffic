class AddSkippableToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :skippable, :boolean, default: true
  end
end
