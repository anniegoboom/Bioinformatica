class TagTypes < ActiveRecord::Base
  attr_accessible :type

  validates :type, presence: true

  has_many :tags
end
