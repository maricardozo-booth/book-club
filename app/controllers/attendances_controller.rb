class AttendancesController < ApplicationController

  def create
    the_attendance = Attendance.new
    the_attendance.member_id = params.fetch("query_member_id")
    the_attendance.meeting_id = params.fetch("query_meeting_id")

    if the_attendance.valid?
      the_attendance.save
      redirect_to("/meetings/#{the_attendance.meeting_id}", { :notice => "Attendance created successfully." })
    else
      redirect_to("/", { :alert => the_attendance.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_attendance = Attendance.where({ :id => the_id }).at(0)

    the_attendance.member_id = params.fetch("query_member_id")
    the_attendance.meeting_id = params.fetch("query_meeting_id")

    if the_attendance.valid?
      the_attendance.save
      redirect_to("/meetings/#{the_attendance.meeting_id}", { :notice => "Attendance updated successfully."} )
    else
      redirect_to("/meetings/#{the_attendance.meeting_id}", { :alert => the_attendance.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_attendance = Attendance.where({ :id => the_id }).at(0)

    the_attendance.destroy

    redirect_to("/attendances", { :notice => "Attendance deleted successfully."} )
  end
end
