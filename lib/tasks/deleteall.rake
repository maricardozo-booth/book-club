task(:deleteall => :environment) do
  if Rails.env.development?
    Member.destroy_all
    Reading.destroy_all
    Vote.destroy_all
    Reading.destroy_all
    Attendance.destroy_all
    Meeting.destroy_all
  end
end
