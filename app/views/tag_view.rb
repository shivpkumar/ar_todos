module TagView
  
  def print_destroy
    puts "Deleted tag: #{self.name}"
  end
  
  def print_tag #used when listing all tags
    puts "#{self.id}. #{self.name}"
  end
end
