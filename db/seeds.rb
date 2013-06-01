require 'faker'
require_relative '../config/application'

10.times do
  List.create(name: "#{Faker::Lorem.word} #{Faker::Lorem.word}")
end

50.times do
  Task.create(description: Faker::Lorem.sentence, list_id: rand(1..10))
end

10.times do
  Tag.create(name: "#{Faker::Lorem.word} #{Faker::Lorem.word}")
end

20.times do
  TasksTag.create(task_id: rand(1..10), tag_id: rand(1..10))
end
