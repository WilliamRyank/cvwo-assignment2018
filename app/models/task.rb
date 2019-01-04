class Task < ApplicationRecord
  belongs_to :user
  validates :task_name, presence: true, length: {minimum:3, maximum: 25}
  validates :task_due, presence: true
  validates :user_id, presence: true
end
