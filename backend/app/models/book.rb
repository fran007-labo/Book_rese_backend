class Book < ApplicationRecord
  has_many :reservations

  has_many :categories
  has_many :images
end
