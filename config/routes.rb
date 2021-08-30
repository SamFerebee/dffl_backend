Rails.application.routes.draw do

  ###USER STUFF
  post "/create_account", to: "users#create_account"
  post "/login", to: "users#login"

  ###GET DATA
  get "/get_season_data", to: "users#get_season_data"
  get "/get_all_time_data", to: "users#get_all_time_data"
end
