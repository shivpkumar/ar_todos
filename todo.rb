require_relative 'config/application'

CLASSES = ["List","Task","Tag"]

if ARGV.any?
  args = ARGV[2..-1]
  
  if CLASSES.include?(ARGV[0].capitalize)
    klass = ARGV[0].capitalize.constantize
    if klass.methods.include?(ARGV[1].to_sym)
      if ARGV.length > 2
        klass.send(ARGV[1].to_sym, args)
      else
        klass.send(ARGV[1].to_sym)
      end
    else
      puts "Error: Unknown argument."
    end
  else
    puts "Error: class #{ARGV[0]} does not exist."
  end
else
  puts "Error: No arguments."
end


