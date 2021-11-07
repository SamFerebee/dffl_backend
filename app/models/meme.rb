class Meme < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  has_many :comments

  def average_rating
    self.rating / self.num_of_ratings
  end

end
