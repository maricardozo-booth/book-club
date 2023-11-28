class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.integer :member_id
      t.integer :meeting_id

      t.timestamps
    end
  end
end
