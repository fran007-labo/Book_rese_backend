class CartBook < ApplicationRecord
  belongs_to :cart
  belongs_to :book

  validates :book, uniqueness: true
end
