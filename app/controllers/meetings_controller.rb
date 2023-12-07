class MeetingsController < ApplicationController
  def index
    matching_meetings = Meeting.all

    @list_of_meetings = matching_meetings.order({ :created_at => :desc })

    matching_books = Book.all

    @expired_books = matching_books.where({ :status => "Past reading" })
    render({ :template => "meetings/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_meetings = Meeting.where({ :id => the_id })

    @the_meeting = matching_meetings.at(0)

    matching_attendances = Attendance.where({ :meeting_id => the_id })

    @list_of_attendances = matching_attendances.order({ :created_at => :desc })

    render({ :template => "meetings/show" })
  end

  def new
    matching_meetings = Meeting.all

    @list_of_meetings = matching_meetings.order({ :created_at => :desc })

    @active_meetings = matching_meetings.where.not({ :status => "Past Meeting" })

    matching_books = Book.all

    @list_of_books = matching_books.order({ :created_at => :desc })

    @potential_books = matching_books.where({ :status => "Potential Club reading" })

    matching_votes = Vote.all

    @list_of_votes = matching_votes.order({ :created_at => :desc })
    
    render({ :template => "meetings/new" })
  end

  def create
    the_meeting = Meeting.new
    the_meeting.date = params.fetch("query_date")
    the_meeting.book_id = params.fetch("query_book_id")
    the_meeting.status = params.fetch("query_status")
    the_meeting.attendances_count = "0"

    if the_meeting.valid?
      the_meeting.save
      redirect_to("/meetings/new", { :notice => "Meeting created successfully." })
    else
      redirect_to("/meetings", { :alert => the_meeting.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @the_meeting = Meeting.where({ :id => the_id }).at(0)

    @the_meeting.date = params.fetch("query_date")
    @the_meeting.book_id = params.fetch("query_book_id")
    @the_meeting.status = params.fetch("query_status")
    @the_meeting.attendances_count = params.fetch("query_attendances_count")
    @the_meeting.notes = params.fetch("query_notes")
    @the_meeting.photos= params.fetch("query_photos")

    if @the_meeting.valid?
      @the_meeting.save
      redirect_to("/meetings/#{@the_meeting.id}", { :notice => "Meeting updated successfully."} )
    else
      redirect_to("/meetings/#{@the_meeting.id}", { :alert => @the_meeting.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_meeting = Meeting.where({ :id => the_id }).at(0)

    the_meeting.destroy

    redirect_to("/meetings", { :notice => "Meeting deleted successfully."} )
  end
end
