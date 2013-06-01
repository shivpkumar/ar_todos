class CreateTasksTagsTable < ActiveRecord::Migration
  def change
    create_table :tasks_tags do |t|
      t.references :tag
      t.references :task 
    end  
  end
end
