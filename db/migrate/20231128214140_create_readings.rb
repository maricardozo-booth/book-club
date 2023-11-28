class CreateReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :readings do |t|
      t.integer :member_id
      t.integer :book_id
      t.string :status
      t.float :progress

      t.timestamps
    end
  end
end
