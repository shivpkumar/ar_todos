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

  def self.get_tag_ids(task_id)
    array_taskstag_objects = TasksTag.where("task_id = #{task_id}")
    array_taskstag_objects.inject([]) { |tag_ids,taskstag_ob| tag_ids << taskstag_ob.tag_id }
  end

  # def self.get_tagnames(task_id)
    # taskstag_objects = TasksTag.where("task_id = #{task_id}")
    # taskstag_objects.inject([]) { |tagnames,taskstag_object| tagnames << Tag.find(taskstag_object.tag_id).name }
  # end

end
            
