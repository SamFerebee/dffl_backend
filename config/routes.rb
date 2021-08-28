Rails.application.routes.draw do

  ###USER STUFF
  post "/create_account", to: "users#create_account"
  post "/login", to: "users#login"
end
