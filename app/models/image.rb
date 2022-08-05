class Image < ApplicationRecord
  mount_uploader :src, ImageUploader

  has_many :book_images
end
