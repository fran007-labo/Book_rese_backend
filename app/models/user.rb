class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :uid,  presence: true

  has_one :cart, dependent: :destroy

  def prepare_cart
    cart || create_cart
  end
end
