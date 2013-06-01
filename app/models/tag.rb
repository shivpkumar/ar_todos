class Tag < ActiveRecord::Base

  has_many :tasks_tags, dependent: :destroy
  has_many :tasks, :through => :tasks_tags
  validates :name, :uniqueness => true

  def self.display_all
    Tag.all.each { |tag| tag.print_tag }
  end

  def self.delete(tag_id)
    tag = Tag.find(task_id)
    tag.print_destroy
    Tag.destroy(task_id)
  end

  private

  def self.get_tag(tag_name)
     Tag.create(name: tag_name) unless Tag.find_by_name(tag_name)
  end
end
