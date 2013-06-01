class TasksTag < ActiveRecord::Base
  validates_presence_of :task_id, :tag_id
  belongs_to :task
  belongs_to :tag
end
