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

  @past_readings = matching_readings.where({ :status => "Past reading" })

  matching_active_reading = matching_readings.where({ :status => "Currently reading" })

  @active_reading = matching_active_reading.at(0)

  render({ :template => "members/show" })

end
end
