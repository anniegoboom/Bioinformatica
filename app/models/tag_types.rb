class TagTypes < ActiveRecord::Base
  attr_accessible :type

  has_many :tags
end
