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
            user = User.create(username: params[:username], password: params[:password], email: params[:email], avatar: params["avatar"], season_records: {}, season_points: {}, championships: [], playoff_appearances: [])
            user.season_records[2021] = {wins: 0, losses: 0};
            user.season_points[2021] = {for: 0, against: 0}
            user.create_new_account_season_info(user.email)
            user.create_new_account_season_points
            user.create_new_account_member_admin_status
            user.save
            if user.valid?
                token = JWT.encode({user_id: user.id}, "secret", "HS256")
                render json: user
            else
                render json: user.errors.full_messages
            end
        end
    end

    def get_season_data
        dataHash = {};
        ##get season_records[2021] for each
        User.all.each do |user|
            if user.member == true
                dataHash[user.current_season_rank] = {name: user.username, avatar: url_for(user.avatar_attachment), wins: user.season_records["2021"]["wins"], losses: user.season_records["2021"]["losses"], points_for: user.season_points["2021"]["for"], points_against: user.season_points["2021"]["against"]}
            end
        end
        render json: dataHash
    end

end
