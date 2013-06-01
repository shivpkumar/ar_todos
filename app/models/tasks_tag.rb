class TasksTag < ActiveRecord::Base
  
  belongs_to :task
  belongs_to :tag
  validates_presence_of :task_id, :tag_id

  private

  def self.add(task_id, tag_id)
    TasksTag.create(task_id: task_id, tag_id: tag_id)
  end

  def self.get_task_ids(tag_id)
    tasks_tags = TasksTag.where("tag_id = #{tag_id}")
    tasks_tags.inject([]) { |task_ids, tasks_tag| task_ids << tasks_tag.task_id }
  end
end
