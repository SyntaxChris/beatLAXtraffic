class CreateFreeformResponses < ActiveRecord::Migration
  def change
    create_table :freeform_responses do |t|
      t.text :response_text

      t.timestamps
    end
  end
end
