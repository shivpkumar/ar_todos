require_relative 'config/application'

CLASSES = ["List","Task","Tag"]

if ARGV.any?
  args = ARGV[1..-1].join(' ')
  
  if CLASSES.include?(ARGV[0])
    klass = ARGV[0].constantize
    if klass.methods.include?(ARGV[0].to_sym)
      if ARGV.length > 1
        klass.send(ARGV[0].to_sym, args)
      else
        klass.send(ARGV[0].to_sym)
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


