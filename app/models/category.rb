class Category < ApplicationRecord
  has_many :tasks
  before_save :capitalize

  validates :name, presence: true

  def capitalize
    self.name = name.capitalize
  end

end
