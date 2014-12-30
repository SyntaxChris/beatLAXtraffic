class ChangeColumnWhoPickingUpInRespondent < ActiveRecord::Migration
  def change
    rename_column :respondents, :who_picking_up, :original_who_picking_up
  end
end
