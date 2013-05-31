class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :complete
    end
  end
end
