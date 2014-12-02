class AddTimesCircledToRespondent < ActiveRecord::Migration
  def change
    add_column :respondents, :times_circled, :integer
  end
end
