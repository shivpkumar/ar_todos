class TasksTag < ActiveRecord::Base
  
  belongs_to :task
  belongs_to :tag
  validates_presence_of :task_id, :tag_id
end
