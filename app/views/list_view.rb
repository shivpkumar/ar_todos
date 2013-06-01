module ListView
  
  def print_add
    if self.id
      puts "Created list: #{self.name}"
    else
      puts "Error: list \"#{self.name}\" already exists"
    end
  end

  def print_destroy
    puts "Deleted list: #{self.name}"
  end
  
  def print_list
    puts "#{self.id}. #{self.name}"
  end
end



