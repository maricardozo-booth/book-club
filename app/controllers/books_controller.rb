class BooksController < ApplicationController

  def show
    the_id = params.fetch("path_id")

    matching_books = Book.where({ :id => the_id })

    @the_book = matching_books.at(0)

    render({ :template => "books/show" })
  end

  def homepage
    matching_books = Book.all

    @list_of_books = matching_books.order({ :created_at => :desc })

    @active_book = matching_books.where({ :status => "Current Club read" })
    
    @expired_books = matching_books.where({ :status => "Past Club read" })

    @future_books = matching_books.where({ :status => "Potential Club read" })

    @poll_books = matching_books.where({ :status => "Current poll" })

    t = Date.today

    matching_meetings = Meeting.all

    @list_of_meetings = matching_meetings.order({ :created_at => :desc })

    @future_meetings = matching_meetings.where('date > ?', t)

    @active_meeting = @future_meetings.at(0)

    @next_meeting = @future_meetings.at(1)

    render({ :template => "books/homepage" })
  end

  def create
    the_book = Book.new
    the_book.title = params.fetch("query_title")
    the_book.author = params.fetch("query_author")
    the_book.status = params.fetch("query_status")
    the_book.genre = params.fetch("query_genre")
    the_book.number_of_pages = params.fetch("query_number_of_pages")
    the_book.cover_image_url = params.fetch("query_cover_url")
    
    if the_book.valid?
      the_book.save
      redirect_to("/books/#{the_book.id}", { :notice => "Book created successfully." })
    else
      redirect_to("/books", { :alert => the_book.errors.full_messages.to_sentence })
    end

  end

  def update
    the_id = params.fetch("path_id")
    the_book = Book.where({ :id => the_id }).at(0)

    the_book.title = params.fetch("query_title")
    the_book.status = params.fetch("query_status")
    the_book.author = params.fetch("query_author")
    the_book.genre = params.fetch("query_genre")
    the_book.number_of_pages = params.fetch("query_number_of_pages")

    if the_book.valid?
      the_book.save
      redirect_to("/books/#{the_book.id}", { :notice => "Book updated successfully."} )
    else
      redirect_to("/books/#{the_book.id}", { :alert => the_book.errors.full_messages.to_sentence })
    end
  end

  def poll_update
    matching_books = Book.all

    @potential_books = matching_books.where({ :status => "Potential Club read" })

    book_ids = params.fetch("query_book_ids")
    if book_ids.is_a? String
      the_book = Book.where({ :id => book_ids })
      the_book.update({ :status => "Current poll" })
    else 
    book_ids.each do 
      the_book = Book.where({ :id => book_ids }).at(0)
      the_book.update({ :status => "Current poll" })
    end 
  end 
  redirect_to("/meetings/new", { :notice => "Poll created successfully."} )
  end

  def poll_close
    matching_books = Book.all

    @potential_books = matching_books.where({ :status => "Potential Club read" })

   @book_ids = params.fetch("query_book_ids")
   the_first_book = Book.where({ :id => @book_ids }).at(0)
   the_first_book.update({ :status => "Chosen read" })

   old_poll = matching_books.where({ :status => "Current poll" })
   old_poll.update_all({ :status => "Past Club read" })

  redirect_to("/meetings/new", { :notice => "Poll closed successfully."} )
  end

  def destroy
    the_id = params.fetch("path_id")
    the_book = Book.where({ :id => the_id }).at(0)

    the_book.destroy

    redirect_to("/meetings", { :notice => "Book deleted successfully."} )
  end
end 
