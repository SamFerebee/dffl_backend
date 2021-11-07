class MemesController < ApplicationController

    def upload_meme
        user = User.find(params[:user])
        meme = Meme.create(title: params[:title], file: params[:file], user: user)
        meme.save
        render json: Meme.all
    end

    def get_all
        render json: Meme.all
    end

    def get_meme
        meme = Meme.find(params[:id])
        render json: meme
    end

end
