# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :string
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  meeting_id :integer
#
class Message < ApplicationRecord
  validates(:meeting_id, presence: true)
  
  belongs_to :meeting

end
