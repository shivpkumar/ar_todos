require 'faker'
require_relative '../config/application'

50.times do
  Task.create(description: Faker::Lorem.sentence)
end
