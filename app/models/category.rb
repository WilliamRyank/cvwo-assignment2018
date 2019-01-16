class Category < ApplicationRecord
  has_many :tasks
  before_save :titleize

  validates :name, presence: true, length: {minimum: 4}

  def titleize
    self.name = name.titleize
  end

end
