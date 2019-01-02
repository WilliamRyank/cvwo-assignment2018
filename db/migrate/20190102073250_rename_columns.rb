class RenameColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :task, :task_name
    rename_column :tasks, :description, :task_description
  end
end
