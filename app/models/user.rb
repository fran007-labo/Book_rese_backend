class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :uid,  presence: true

  has_one :cart, dependent: :destroy

  # def prepare_reservation
  #   reservation || create_reservation
  # end
end
