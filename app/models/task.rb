class Task < ApplicationRecord
  validates :task, presence: true, length: {minimum:3, maximum: 25}
end
