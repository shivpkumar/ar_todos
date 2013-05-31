module View
  
  def print_add
    puts "Appended \"#{self.description}\" to your TODO list."
  end

  def print_destroy
    puts "Deleted \"#{self.description}\" from your TODO list."
  end
  
  def print_task
    mark = self.complete? ? "X" : " "
    puts "[#{mark}] #{self.id} #{self.description}"
  end

  def print_complete
    puts "Completed task: #{self.description}"
  end
end
