class Task < ApplicationRecord
  validates :task_name, presence: true, length: {minimum:3, maximum: 25}
  validates :task_due, presence: true
end
