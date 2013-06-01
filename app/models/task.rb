require_relative '../views/task_view'

class Task < ActiveRecord::Base
  
  include TaskView

  has_many :tasks_tags, dependent: :destroy
  has_many :tags, through: :tasks_tags
  belongs_to :list

  def self.add(args)
    task = Task.create(description: args[1], list_id: args[0])
    task.print_add
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


end
