class AddPickingUpNumberToRespondent < ActiveRecord::Migration
  def change
    add_column :respondents, :picking_up_number, :integer
  end
end
