class TasksTag < ActiveRecord::Base
  
  belongs_to :task
  belongs_to :tag
  validates_presence_of :task_id, :tag_id

  private

  def self.add(task_id, tag_id)
    TasksTag.create(task_id: task_id, tag_id: tag_id)
  end

  def self.get_tasks(tag_id)
    TasksTag.where("tag_id = #{tag_id}")
  end
end
