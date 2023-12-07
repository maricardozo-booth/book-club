# == Schema Information
#
# Table name: readings
#
#  id         :integer          not null, primary key
#  progress   :integer
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#  member_id  :integer
#
class Reading < ApplicationRecord
  validates(:member_id, :book_id, presence: { message: "must be given please" })

  belongs_to :member, counter_cache: true
  belongs_to :book_read, class_name: "Book", foreign_key: "book_id"
end
