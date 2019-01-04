class User < ApplicationRecord
  has_many :tasks
  validates :username, presence: true, length: {minimum:6, maximum:15},
            uniqueness: {case_sensitive: true}

  has_secure_password
end
