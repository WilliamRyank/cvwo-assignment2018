class Category < ApplicationRecord
  has_many :tasks
  before_save :capitalize
  validates :name, uniqueness: {case_sensitive: false}

  def capitalize
    self.name = name.capitalize
  end
  
end
