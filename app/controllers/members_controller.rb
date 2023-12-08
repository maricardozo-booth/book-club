class MembersController < ApplicationController

  def index
    matching_members = Member.all

    @list_of_members = matching_members.order({ :created_at => :desc })

    render({ :template => "members/index" })
  end
  
def show
  the_id = params.fetch("path_id")

  matching_members = Member.where({ :id => the_id })

  @the_member = matching_members.at(0)

  matching_readings = Reading.where({ :member_id => the_id })

  @past_readings = matching_readings.where({ :status => "Past read" })

  matching_active_reading = matching_readings.where({ :status => "Currently reading" })

  @active_reading = matching_active_reading.at(0)

  matching_meetings = Meeting.all

  @list_of_meetings = matching_meetings.order({ :created_at => :desc })
  @active_meeting = matching_meetings.where({ :status => "Current meeting" })

  matching_books = Book.all

  @list_of_books = matching_books.order({ :created_at => :desc })

  render({ :template => "members/show" })

end

def my_profile
  the_id = current_member.id 
  
  matching_members = Member.where({ :id => the_id })

  @the_member = matching_members.at(0)

  matching_readings = Reading.where({ :member_id => the_id })

  @past_readings = matching_readings.where({ :status => "Past read" })

  matching_active_reading = matching_readings.where({ :status => "Currently reading" })

  @active_reading = matching_active_reading.at(0)

  matching_meetings = Meeting.all

  @list_of_meetings = matching_meetings.order({ :created_at => :desc })
  @active_meeting = matching_meetings.where({ :status => "Current meeting" })

  matching_books = Book.all

  @list_of_books = matching_books.order({ :created_at => :desc })

  render({ :template => "members/profile" })

end
end
