class AddFinalWhoPickingUpToRespondent < ActiveRecord::Migration
  def change
    add_column :respondents, :final_who_picking_up, :string
  end
end
