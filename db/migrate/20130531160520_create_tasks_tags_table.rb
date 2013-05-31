class CreateTasksTagsTable < ActiveRecord::Migration
  def change
    create_table :tasks_tags do |t|
      t.references :tag_id
      t.references :task_id 
    end  
  end
end
