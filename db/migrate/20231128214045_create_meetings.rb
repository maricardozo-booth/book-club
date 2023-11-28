class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.date :date
      t.integer :book_id
      t.string :status
      t.integer :attendances_count

      t.timestamps
    end
  end
end
