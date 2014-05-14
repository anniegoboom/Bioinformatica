class InfoSnippet < ActiveRecord::Base
  has_many :tags

  validates :text, presence: true

  attr_accessible :text
end
