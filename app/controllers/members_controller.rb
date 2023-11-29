class MembersController < ApplicationController

  def index
    matching_members = Member.all

    @list_of_members = matching_members.order({ :created_at => :desc })

    render({ :template => "members/index" })
  end
  
def show
  the_id = params.fetch("path_id")

  matching_members = Member.where({ :id => the_id })

  @the_member = matching_readings.at(0)

  render({ :template => "members/show" })
end
end
