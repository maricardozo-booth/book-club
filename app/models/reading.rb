# == Schema Information
#
# Table name: readings
#
#  id         :integer          not null, primary key
#  progress   :float
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#  member_id  :integer
#
class Reading < ApplicationRecord
  belongs_to :member, counter_cache: true
  belongs_to :read_book, class_name: "Book", foreign_key: "book_id", counter_cache: :readers_count
end