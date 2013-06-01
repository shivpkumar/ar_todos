require_relative '../views/list_view'

class List < ActiveRecord::Base

  include ListView

  validates :name, :uniqueness => true
  has_many :tasks, dependent: :destroy

  def self.add(list_name)
    list = List.create(name: list_name.join(' '))
    list.print_add
  end

  def self.delete(list_id)
    list = List.find(list_id)
    list.print_destroy
    List.destroy(list_id)
  end

  def self.display_all
    List.all.each { |list| list.print_list }
  end
end
