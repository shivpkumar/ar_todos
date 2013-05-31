require 'faker'
require_relative '../config/application'

1000.times do
  Task.create(description: Faker::Lorem.sentence)
end
