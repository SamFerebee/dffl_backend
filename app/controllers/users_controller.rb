class UsersController < ApplicationController

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            token = JWT.encode({user_id: user.id}, "secret", "HS256")
            render json: user
        else
            render json: ["Incorrect username or password"]
        end
    end

    def create_account
        if params[:password] != params[:confirmation]
            render json: ["Passwords must match"]
        else
            user = User.create(username: params[:username], password: params[:password], email: params[:email], avatar: params["avatar"])
            if user.valid?
                token = JWT.encode({user_id: user.id}, "secret", "HS256")
                render json: user
            else
                render json: user.errors.full_messages
            end
        end
    end

end
