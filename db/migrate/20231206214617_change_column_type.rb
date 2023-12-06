class ChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column(:readings, :progress, :integer)
  end
end
