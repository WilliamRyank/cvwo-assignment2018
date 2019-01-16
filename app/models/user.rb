class User < ApplicationRecord
  has_many :tasks
  has_many :categories, through: :tasks
  validates :username, presence: true, length: {minimum:6, maximum:15},
            uniqueness: {case_sensitive: false}

  has_secure_password
end
