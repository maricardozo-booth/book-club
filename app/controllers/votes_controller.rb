class VotesController < ApplicationController
  def index
    matching_votes = Vote.all

    @list_of_votes = matching_votes.order({ :created_at => :desc })

    render({ :template => "votes/index" })
  end


  def create
    the_vote = Vote.new
    the_vote.book_id = params.fetch("query_book_id")
    the_vote.member_id = params.fetch("query_member_id")

    if the_vote.valid?
      the_vote.save
      redirect_to("/", { :notice => "Vote created successfully." })
    else
      redirect_to("/", { :alert => the_vote.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_vote = Vote.where({ :id => the_id }).at(0)

    the_vote.book_id = params.fetch("query_book_id")
    the_vote.member_id = params.fetch("query_member_id")

    if the_vote.valid?
      the_vote.save
      redirect_to("/votes/#{the_vote.id}", { :notice => "Vote updated successfully."} )
    else
      redirect_to("/votes/#{the_vote.id}", { :alert => the_vote.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_vote = Vote.where({ :id => the_id }).at(0)

    the_vote.destroy

    redirect_to("/votes", { :notice => "Vote deleted successfully."} )
  end
end
