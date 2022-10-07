class Book < ApplicationRecord
  has_many :reservations
  has_many :categories
  has_many :images, :dependent => :destroy

  has_many :cart_books, dependent: :destroy

end
