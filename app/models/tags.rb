class Tags < ActiveRecord::Base
  belongs_to :tag_type
  has_many :info_snippets

  attr_accessible :tag, :tag_type_id
end
