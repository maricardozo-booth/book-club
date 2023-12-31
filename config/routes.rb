Rails.application.routes.draw do
  # Routes for the Message resource:

  # CREATE
  post("/insert_message", { :controller => "messages", :action => "create" })
          
  # READ
  get("/messages", { :controller => "messages", :action => "index" })
  
  get("/messages/:path_id", { :controller => "messages", :action => "show" })
  
  # UPDATE
  
  post("/modify_message/:path_id", { :controller => "messages", :action => "update" })
  
  # DELETE
  get("/delete_message/:path_id", { :controller => "messages", :action => "destroy" })

  #------------------------------

  # Routes for the Vote resource:

  post("/insert_poll", { :controller => "books", :action => "poll_update" })

  post("/close_poll", { :controller => "books", :action => "poll_close" })

  # CREATE
  post("/insert_vote", { :controller => "votes", :action => "create" })
          
  # READ
  get("/votes", { :controller => "votes", :action => "index" })
  
  # UPDATE
  
  post("/modify_vote/:path_id", { :controller => "votes", :action => "update" })
  
  # DELETE
  get("/delete_vote/:path_id", { :controller => "votes", :action => "destroy" })

  #------------------------------

  # Routes for the Reading resource:

  # CREATE
  post("/insert_reading", { :controller => "readings", :action => "create" })
  
  get("/readings/:path_id", { :controller => "readings", :action => "show" })
  
  # UPDATE
  
  post("/modify_reading/:path_id", { :controller => "readings", :action => "update" })
  
  # DELETE
  get("/delete_reading/:path_id", { :controller => "readings", :action => "destroy" })

  #------------------------------

  # Routes for the Attendance resource:

  # CREATE
  post("/insert_attendance", { :controller => "attendances", :action => "create" })
          
  # READ
  get("/attendances", { :controller => "attendances", :action => "index" })
  
  get("/attendances/:path_id", { :controller => "attendances", :action => "show" })
  
  # UPDATE
  
  post("/modify_attendance/:path_id", { :controller => "attendances", :action => "update" })
  
  # DELETE
  get("/delete_attendance/:path_id", { :controller => "attendances", :action => "destroy" })

  #------------------------------

  # Routes for the Meeting resource:

  # CREATE
  post("/insert_meeting", { :controller => "meetings", :action => "create" })
          
  # READ
  get("/meetings", { :controller => "meetings", :action => "index" })

  get("/meetings/new", { :controller => "meetings", :action => "new" })
  
  get("/meetings/:path_id", { :controller => "meetings", :action => "show" })
  
  # UPDATE
  
  post("/update_meeting/:path_id", { :controller => "meetings", :action => "update" })
  
  # DELETE
  get("/delete_meeting/:path_id", { :controller => "meetings", :action => "destroy" })

  #------------------------------

  # Routes for the Book resource:

  # CREATE
  post("/insert_book", { :controller => "books", :action => "create" })
          
  # READ
  
  get("/books/:path_id", { :controller => "books", :action => "show" })
  
  # UPDATE
  
  post("/modify_book/:path_id", { :controller => "books", :action => "update" })
  
  # DELETE
  get("/delete_book/:path_id", { :controller => "books", :action => "destroy" })

  #------------------------------

  devise_for :members
  get("/members/:path_id", { :controller => "members", :action => "show" })

  get("/members/profile/:path_id", { :controller => "members", :action => "my_profile" })

  get("/members", { :controller => "members", :action => "index" })

  # Defines the root path route ("/")
  root "books#homepage"

end
