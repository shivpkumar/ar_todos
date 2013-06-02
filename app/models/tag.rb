require_relative '../views/tag_view'

class Tag < ActiveRecord::Base

  include TagView

  has_many :tasks_tags, dependent: :destroy
  has_many :tasks, :through => :tasks_tags
  validates :name, :uniqueness => true

  def self.display_all
    Tag.all.each { |tag| tag.print_tag }
  end

  def self.delete(tag_id)
    tag = Tag.find(tag_id)[0]
    tag.print_destroy
    Tag.destroy(tag_id)
  end

  private

  def self.get_tag_names(tag_ids)
    tag_ids.inject([]) {|tag_names,tag_id| tag_names << Tag.find(tag_id).name}
  end

  def self.get_tag(tag_name)
     Tag.create(name: tag_name) unless Tag.find_by_name(tag_name)
  end
end
