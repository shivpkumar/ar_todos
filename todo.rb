require_relative 'config/application'

if ARGV.any?
  args = ARGV[1..-1].join(' ')
  
  if Task.methods.include?(ARGV[0].to_sym)
    if ARGV.length > 1
      Task.send(ARGV[0].to_sym, args)
    else
      Task.send(ARGV[0].to_sym)
    end
  elsif List.methods.include?(ARGV[1].to_sym)
    # do something
  else
    puts "Error: Unknown argument."
  end
else
  puts "Error: No arguments."
end


