# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#  meeting_id :integer
#  member_id  :integer
#
class Vote < ApplicationRecord
  validates(:member_id, :book_id, :meeting_id, presence: { message: "must be given please" })
  
  belongs_to :member
  belongs_to :meeting
  belongs_to :book_voted, class_name: "Book", foreign_key: "book_id"

end
