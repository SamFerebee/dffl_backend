class MemesController < ApplicationController

    def upload_meme
        user = User.find(params[:user])
        meme = Meme.create(title: params[:title], file: params[:file], user: user, num_of_ratings: 0, rating: 0)
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

    def rate_meme

        user = User.find(params[:user])
        temp = user.memes_rated;
        temp.push(params[:meme])
        user.update(memes_rated: temp)
        meme = Meme.find(params[:meme])
        meme.update(num_of_ratings: (meme.num_of_ratings + 1))
        meme.update(rating: (meme.rating + params[:rating].to_f))
        render json: meme
    end

    def create_comment
        user = User.find(params[:user])
        meme = Meme.find(params[:meme])
        comment = Comment.create(user: user, meme: meme, comment: params[:comment])
        comment.save
        render json: meme
    end

end
