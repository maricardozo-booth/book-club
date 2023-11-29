class AddNotesToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column(:meetings, :notes, :string)
  end
end
