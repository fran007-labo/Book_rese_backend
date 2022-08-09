class Cart < ApplicationRecord
  has_many :cart_books, dependent: :destroy
  has_many :books     ,   through: :cart_books
end
