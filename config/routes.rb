Rails.application.routes.draw do

  resources :chats
  resources :comments
  ###USER STUFF
  post "/create_account", to: "users#create_account"
  post "/login", to: "users#login"
  get "/get_user/:id", to: "users#me"
  get "/all_users", to: "users#all"

  ###GET DATA
  get "/get_season_data", to: "users#get_season_data"
  get "/get_all_time_data", to: "users#get_all_time_data"

  ###MEME STUFF
  post "/upload_meme", to: "memes#upload_meme"
  get "/hall_of_memes", to: "memes#get_all"
  get "/view_meme/:id", to: "memes#get_meme"
  patch "/rate_meme", to: "memes#rate_meme"
  post "/create_comment", to: "memes#create_comment"

  ###CHAT STUFF
  get "/get_chat", to: "chats#get_messages"
  post "/submit_chat", to: "chats#submit_message"

end
