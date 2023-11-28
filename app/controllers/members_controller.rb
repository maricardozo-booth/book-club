class MembersController < ApplicationController
def show
  the_id = params.fetch("path_id")

  matching_members = Member.where({ :id => the_id })

  @the_member = matching_readings.at(0)

  render({ :template => "members/show" })
end
end
