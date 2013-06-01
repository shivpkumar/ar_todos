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
    list_name = List.find(list_id)
    puts "Deleted \"#{self.description}\" from your \"#{listname}\" TODO list..."
  end
  
  def print_task
    mark = self.complete? ? "X" : " "
    puts "[#{mark}] #{self.id}. #{self.description}"
  end

  def print_complete
    puts "Completed task: #{self.description}"
  end
end



