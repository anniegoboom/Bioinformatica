class Tag < ActiveRecord::Base
  belongs_to :tag_type
  has_many :info_snippets

  validates :tag, presence: true
  validates :tag_type, presence: true
  validates_associated :tag_type
  validates_associated :info_snippets

  attr_accessible :tag, :tag_type_id
end
