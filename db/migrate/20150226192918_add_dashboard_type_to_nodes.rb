class AddDashboardTypeToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :dashboard_type, :string, default: nil
  end
end
