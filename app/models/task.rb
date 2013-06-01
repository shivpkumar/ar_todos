require_relative '../views/view'

class Task < ActiveRecord::Base
  
  include View

  has_many, dependent: :destroy
  has_many :tags, :through => :tasks_tags
  belongs_to :list

  def self.add(args)
    task = Task.create(description: args[:description], list_id: args[:list_id])
    task.print_add
  end

  def self.delete(task_num)
    task = Task.find(task_num)
    task.print_destroy
    Task.destroy(task_num)
  end

  def self.list 
    Task.all.each { |task| task.print_task }
  end

  def self.complete!(task_num)
    task = Task.find(task_num.to_i)
    task.complete = true
    task.save
    task.print_complete
  end
end
