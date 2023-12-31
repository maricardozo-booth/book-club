class ReadingsController < ApplicationController
  def index
    matching_readings = Reading.all

    @list_of_readings = matching_readings.order({ :created_at => :desc })

    render({ :template => "readings/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_readings = Reading.where({ :id => the_id })

    @the_reading = matching_readings.at(0)

    render({ :template => "readings/show" })
  end

  def create
    the_reading = Reading.new
    the_reading.member_id = params.fetch("query_member_id")
    the_reading.book_id = params.fetch("query_book_id")
    the_reading.status = params.fetch("query_status")
    the_reading.progress = params.fetch("query_progress")

    if the_reading.valid?
      the_reading.save
      other_readings = Reading.where({ :member_id => current_member.id }).where.not({ :id => the_reading.id })
      other_readings.update_all({ :status => 'Past read' })
      redirect_to("/members/profile/#{current_member.id}", { :notice => "Reading created successfully."} )
    else
      redirect_to("/members/profile/#{current_member.id}", { :alert => the_reading.errors.full_messages.to_sentence })
    end

  end

  def update
    the_id = params.fetch("path_id")
    the_reading = Reading.where({ :id => the_id }).at(0)

    the_reading.book_id = params.fetch("query_book_id")
    the_reading.member_id = params.fetch("query_member_id")
    the_reading.status = params.fetch("query_status")
    the_reading.progress = params.fetch("query_progress")

    if the_reading.valid?
      the_reading.save
      redirect_to("/members/profile/#{current_member.id}", { :notice => "Reading updated successfully."} )
    else
      redirect_to("/members/profile/#{current_member.id}", { :alert => the_reading.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_reading = Reading.where({ :id => the_id }).at(0)

    the_reading.destroy
    redirect_to("/members/profile/#{current_member.id}", { :notice => "Reading deleted successfully."} )

  end
end
