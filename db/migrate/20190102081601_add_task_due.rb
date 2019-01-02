class AddTaskDue < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :task_due, :datetime
  end
end
