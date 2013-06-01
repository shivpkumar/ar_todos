module ListView
  
  def print_add
    puts "Created list: #{self.name}"
  end

  def print_destroy
    puts "Deleted list: #{self.name}"
  end
  
  def print_list
    puts "#{self.id}. #{self.name}"
  end
end



