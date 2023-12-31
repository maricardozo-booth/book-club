# == Schema Information
#
# Table name: books
#
#  id              :integer          not null, primary key
#  author          :string
#  cover_image_url :string
#  genre           :string
#  number_of_pages :integer
#  status          :string
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Book < ApplicationRecord
  validates(:author, :title, :genre, :number_of_pages, :cover_image_url, presence: true)

has_many  :readers, class_name: "Reading"
has_many :votes, class_name: "Vote"
has_many :associated_meetings, class_name: "Meeting"
  
end
