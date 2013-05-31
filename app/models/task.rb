class Task < ActiveRecord::Base

  def add(args)
    Task.create(args)
  end

  def delete(task_num)
    Task.destroy(task_num)
  end

  def list
    Task.all
  end

  def complete!(task_num)
    task = Task.find(task_num)
    task.complete = true
    task.save
  end
end


