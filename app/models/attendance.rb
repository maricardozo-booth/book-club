# == Schema Information
#
# Table name: attendances
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  meeting_id :integer
#  member_id  :integer
#
class Attendance < ApplicationRecord
  belongs_to :member, counter_cache: :meeting_attended_count
  belongs_to :monthly_meeting, class_name: "Meeting", foreign_key: "meeting_id", counter_cache: true
  
end
