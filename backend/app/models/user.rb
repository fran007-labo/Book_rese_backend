class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :uid,  presence: true
end
