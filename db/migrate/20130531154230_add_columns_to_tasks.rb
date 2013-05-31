class AddColumnsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :completed_at, :date
    add_column :tasks, :list_id, :integer
    add_index :tasks, :list_id 
  end
end
