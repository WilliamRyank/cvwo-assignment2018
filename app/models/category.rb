class Category < ApplicationRecord
  has_many :tasks
  validates :name, uniqueness: {case_sensitive: false}
end
