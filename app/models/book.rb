# == Schema Information
#
# Table name: books
#
#  id              :integer          not null, primary key
#  author          :string
#  cover_image_url :string
#  genre           :string
#  number_of_pages :integer
#  readers_count   :integer
#  status          :string
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Book < ApplicationRecord
  validates(:title, presence: true, uniqueness: true)
  validates(:author, presence: true)
  
  has_many  :readers, class_name: "Reading"
  
end