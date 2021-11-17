class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :content, :image_url, :created_at, :updated_at
  belongs_to :user
  has_many :comments
  has_many :likes

  def image_url
    return rails_blob_path(object.image, only_path: true) if object.image.attached?
  end
end
