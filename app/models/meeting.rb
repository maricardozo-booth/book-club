# == Schema Information
#
# Table name: meetings
#
#  id                :integer          not null, primary key
#  attendances_count :integer
#  date              :date
#  status            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  book_id           :integer
#
class Meeting < ApplicationRecord
  has_many  :attendances, dependent: :destroy
  belongs_to :book, class_name: "Book", foreign_key: "book_id"
end
