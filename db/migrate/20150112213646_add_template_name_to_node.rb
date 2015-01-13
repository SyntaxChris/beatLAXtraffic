class AddTemplateNameToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :template_name, :string
  end
end
