class MessagesController < ApplicationController
  def index
    matching_messages = Message.all

    @list_of_messages = matching_messages.order({ :created_at => :desc })

    render({ :template => "messages/index" })
  end

  def show
    the_id = params.fetch("path_id")

    @matching_messages = Message.where({ :meeting_id => the_id })

    @the_message = @matching_messages.at(0)
    
    render({ :template => "messages/show" })
  end

  def create
    t = Date.today

    the_meeting = Meeting.where('date > ?', t).at(0)
    the_book = the_meeting.book_associated.title

    system_message = Message.new
    system_message.meeting_id = params.fetch("query_meeting_id")
    system_message.role = "system"
    system_message.content = "You are the host of a Book Club for the book #{the_book}."
    system_message.save

    user_message = Message.new
    user_message.meeting_id = params.fetch("query_meeting_id")
    user_message.role = "user"
    user_message.content = "Suggest 10 interesting questions the Club could discuss about #{the_book}."
    user_message.save

    client = OpenAI::Client.new(access_token: ENV.fetch("TEST_GPT_KEY"))

    api_messages_array = Array.new

    context_messages = Message.where({ :meeting_id => system_message.meeting_id }).order(:created_at)

      context_messages.each do |the_message|
        message_hash = { :role => the_message.role, :content => the_message.content }

        api_messages_array.push(message_hash)
      end

      response = client.chat(
        parameters: {
            model: "gpt-3.5-turbo",
            messages: api_messages_array,
            temperature: 1.0,
        }
      )

      assistant_message = Message.new
      assistant_message.meeting_id = system_message.meeting_id
      assistant_message.role = "assistant"
      assistant_message.content = response.fetch("choices").at(0).fetch("message").fetch("content")
      assistant_message.save

      redirect_to("/messages/#{the_meeting.id}", { :notice => "Message created successfully." })
  end

  def update
    the_id = params.fetch("path_id")
    the_message = Message.where({ :id => the_id }).at(0)

    the_message.meeting_id = params.fetch("query_meeting_id")
    the_message.gpt_reply = params.fetch("query_gpt_reply")

    if the_message.valid?
      the_message.save
      redirect_to("/messages/#{the_message.id}", { :notice => "Message updated successfully."} )
    else
      redirect_to("/messages/#{the_message.id}", { :alert => the_message.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_message = Message.where({ :id => the_id }).at(0)

    the_message.destroy

    redirect_to("/messages", { :notice => "Message deleted successfully."} )
  end
end
