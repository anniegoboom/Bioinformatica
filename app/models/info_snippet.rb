class InfoSnippet < ActiveRecord::Base
  has_many :tags

  validates :text, presence: true

  scope :by_tag, order('tag_id ASC')
  scope :by_create_date, order('created_at DESC')
  scope :by_update_date, order('updated_at DESC')

  attr_accessible :text
end
