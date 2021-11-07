class MemeSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :rating, :file, :average_rating, :comments
  belongs_to :user
  has_many :comments

  def file
    if object.file.attached?
      {
        url: rails_blob_url(object.file)
      }
    end
  end
end
