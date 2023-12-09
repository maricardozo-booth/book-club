class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :meeting_id
      t.string :gpt_reply

      t.timestamps
    end
  end
end
