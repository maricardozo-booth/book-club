class AddMeetingToVotes < ActiveRecord::Migration[7.0]
  def change
    add_column(:votes, :meeting_id, :integer)
  end
end
