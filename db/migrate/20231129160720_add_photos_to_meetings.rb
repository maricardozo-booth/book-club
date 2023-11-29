class AddPhotosToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column(:meetings, :photos, :string)
  end
end
