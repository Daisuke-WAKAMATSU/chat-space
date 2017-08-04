class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :body_or_image, presence: true
  mount_uploader :image, ImageUploader
  private
  def body_or_image
    body.presence || image.presence
  end
end
