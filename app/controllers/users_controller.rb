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
            user = User.create(username: params[:username], password: params[:password], email: params[:email], avatar: params["avatar"], season_records: {})
            user.season_records[2021] = {wins: 0, losses: 0};
            if user.email == "sam.ferebee@gmail.com"
                user.season_records[2014] = {wins: 7, losses: 6}
                user.season_records[2015] = {wins: 8, losses: 5}
                user.season_records[2016] = {wins: 8, losses: 5}
                user.season_records[2017] = {wins: 10, losses: 3}
                user.season_records[2018] = {wins: 9, losses: 4}
                user.season_records[2019] = {wins: 7, losses: 6}
                user.season_records[2020] = {wins: 7, losses: 6}
            end
            user.save
            if user.valid?
                token = JWT.encode({user_id: user.id}, "secret", "HS256")
                render json: user
            else
                render json: user.errors.full_messages
            end
        end
    end

end
