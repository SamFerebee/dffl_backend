class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :username, :email, :avatar, :season_records, :total_seasons_wins, :total_seasons_losses, :total_seasons_winning_percentage, :member, :admin, :season_points, :total_seasons_points_for, :total_seasons_points_against, :current_season_rank, :championships, :playoff_appearances, :last_place_finishes, :memes_rated, :chat_secret, :chat_username
  has_many :memes
  has_many :comments

  def avatar
    if object.avatar.attached?
      {
        url: rails_blob_url(object.avatar)
      }
    end
  end
end
