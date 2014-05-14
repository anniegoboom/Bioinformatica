class Tag < ActiveRecord::Base
  belongs_to :tag_type
  has_and_belongs_to_many :info_snippets

  scope :by_name, order('tag ASC')
  scope :by_name_desc, order('tag DESC')

  validates :tag, presence: true
  validates :tag_type, presence: true
  validates_associated :tag_type
  validates_associated :info_snippets

  attr_accessible :tag, :tag_type_id
end
