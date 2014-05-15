class Tag < ActiveRecord::Base
  belongs_to :tag_type
  has_and_belongs_to_many :info_snippets

  scope :by_name, order('name ASC')
  scope :by_name_desc, order('name DESC')

  validates :name, presence: true
  validates :tag_type, presence: true
  validates_associated :tag_type
  validates_associated :info_snippets

  attr_accessible :name, :tag_type_id

  def self.find_or_create_new(name, type)
    tag_type = TagType.find_by_name(type) #TODO: blow up if type not found
    tag = Tag.find_by_name_and_type(name, tag_type) || Tag.create(name: name, tag_type_id: tag_type.id)
  end

  def self.find_by_name_and_type(name, tag_type)
    tag_type.tags.each do |tag|
      return tag if equivalent_names(tag.name, name)
    end
    nil
  end

  private

  #TODO: add similar tag name checks in the future
  def self.equivalent_names(tag_name, name)
    tag_name.downcase == name.downcase
  end
end
