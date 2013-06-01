require_relative '../views/task_view'

class Task < ActiveRecord::Base
  
  include TaskView

  has_many :tasks_tags, dependent: :destroy
  has_many :tags, through: :tasks_tags
  belongs_to :list

  def self.add(args)
    task = Task.create(description: args[:description], list_id: args[:list_id])
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
end
