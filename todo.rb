require_relative 'config/application'

puts "Put your application code in #{File.expand_path(__FILE__)}"

input = gets.chomp

input = 'add do this task'
if task.methods.include?(arg.to_sym)
  task.send(arg.to_sym(args))
end
