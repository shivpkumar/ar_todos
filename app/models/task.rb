require_relative 'view'

class Task < ActiveRecord::Base
  
  include View

  def self.add(args)
    task = Task.create(description: args)
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


