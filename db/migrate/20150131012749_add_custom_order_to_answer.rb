class AddCustomOrderToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :custom_order, :integer
  end
end
