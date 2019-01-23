class Category < ApplicationRecord
  has_many :tasks
  before_save :titleize

  validates :name, presence: true

  def titleize
    self.name = name.titleize
  end

end
