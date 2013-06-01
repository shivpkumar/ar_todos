class List < ActiveRecord::Base

  has_many :tasks, dependent: :destroy

  def self.add(args)

    list = List.create(name: args)
    # list.print_add_list
  end

  def self.delete(list_num)
    list = List.find(list_num)
    # list.print_destroy_list
    List.destroy(list_num)
    #activerecord should delete all tasks in this list
  end

  def self.list
    List.all.each { |list| list.print_list }
  end

  def self.add_task(list_id, description)
    Task.add({description: description, list_id: list_id})
  end

  def self.remove_task(task_id)
    Task.delete(task_id)
  end

end
