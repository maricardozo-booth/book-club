class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :status
      t.string :author
      t.string :genre
      t.integer :number_of_pages
      t.integer :readers_count

      t.timestamps
    end
  end
end
