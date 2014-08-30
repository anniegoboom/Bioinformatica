class TagType < ActiveRecord::Base
  attr_accessible :name

  scope :by_name, order('name ASC')

  validates :name, presence: true

  has_many :tags
end
