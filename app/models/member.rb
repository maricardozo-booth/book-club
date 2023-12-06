# == Schema Information
#
# Table name: members
#
#  id                     :integer          not null, primary key
#  admin_status           :boolean
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  meeting_attended_count :integer
#  profile_picture        :string
#  readings_count         :integer
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_members_on_email                 (email) UNIQUE
#  index_members_on_reset_password_token  (reset_password_token) UNIQUE
#
class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates(:username, presence: true)

has_many  :meetings_attended, class_name: "Attendance"
has_many  :readings, dependent: :destroy

end
