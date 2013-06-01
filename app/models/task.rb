require_relative '../views/task_view'

class Task < ActiveRecord::Base
  
  include TaskView

  has_many :tasks_tags, dependent: :destroy
  has_many :tags, through: :tasks_tags
  belongs_to :list
  validates_presence_of :list_id, :description
  validates :list_id, :numericality => { :only_integer => true }

  def self.add(args)
    task = Task.create(list_id: args[0], description: args[1])
    task.print_add
    add_tags_to_task(args[2..-1]) if args[2]
  end

  def self.delete(task_id)
    task = Task.find(task_id)
    task.print_destroy
    Task.destroy(task_id)
  end

  def self.display_all
    Task.all.each { |task| task.print_task }
  end

  def self.complete!(task_id)
    task = Task.find(task_id.to_i)
    task.complete = true
    task.save
    task.print_complete
  end

  def self.display_per_listid(list_id)
    Task.find(list_id).each { |task| task.print_task }
  end

  def self.display_per_tag(tag_id)
    tasks = get_tasks(tag_id)
    tasks.each { |task| task.print_task }
  end

  private

  def self.add_tags_to_task(tag_names, task_id)
    tag_ids = get_tag_ids(tag_names)
    tag_ids.each { |tag_id| TasksTag.add(task_id, tag_id) }
  end

  def self.get_tag_ids(tag_names)
    tag_names.inject([]) do |tag_ids, tag_name|
      tag_ids << Tag.get_tag(tag_name).id
    end
  end

  def self.get_tasks(tag_id)
    TasksTag.get_tasks(tag_id)
  end
end
