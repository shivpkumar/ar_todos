require_relative '../models/tasks_tag'

module TaskView
  
  def print_add
    if self.list_id == 0
      puts "Error: list_id must be numeric"
    elsif self.description
      list_name = List.find(list_id).name
      puts "Appended \"#{self.description}\" to your \"#{list_name}\" TODO list..." 
    else
      puts "Error: no description included"
    end
  end

  def print_destroy
    list_name = List.find(list_id).name
    puts "Deleted \"#{self.description}\" from your \"#{list_name}\" TODO list..."
  end
  
  def print_task
    mark = self.complete? ? "X" : " "
    tag_ids = TasksTag.get_tag_ids(self.id)
    tag_names = Tag.get_tag_names(tag_ids)
    puts "[#{mark}] #{self.id}. #{self.description} #{tag_names.inspect}"
  end

  def print_complete
    puts "Completed task: #{self.description}"
  end
end



