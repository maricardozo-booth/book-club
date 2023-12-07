class RemoveReadersFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :readers_count, :integer
  end
end
