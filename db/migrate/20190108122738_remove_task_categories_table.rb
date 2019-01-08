class RemoveTaskCategoriesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :task_categories
  end
end
