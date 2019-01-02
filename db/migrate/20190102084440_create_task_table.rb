class CreateTaskTable < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_description
      t.date :task_due
    end
  end
end
