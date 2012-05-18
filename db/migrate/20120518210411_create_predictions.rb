class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
      t.integer :user_id
      t.string :name
      t.integer :predicted_value

      t.timestamps
    end
  end
end
