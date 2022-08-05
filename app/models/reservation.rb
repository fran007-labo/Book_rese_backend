class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :book

  with_options on: :add_books do
    validates :user, presence: true
    validates :book, presence: true
  end

  with_options on: :checkout do
    validates :start_date , presence: true
    validates :return_date, presence: true
  end
end
