class MemeSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :rating, :file
  belongs_to :user

  def file
    if object.file.attached?
      {
        url: rails_blob_url(object.file)
      }
    end
  end
end
