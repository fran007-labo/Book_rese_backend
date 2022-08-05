class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :start_date , presence: true
  validates :return_date, presence: true
end
