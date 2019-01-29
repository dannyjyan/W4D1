class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true
  # validates :email, presence: true
end
