require 'date'

class AddCreatedAtColumn < ActiveRecord::Migration
  def change
    add_column :tasks, :created_at, :date, default: DateTime.now
  end
end
