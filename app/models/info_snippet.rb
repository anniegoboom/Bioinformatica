class InfoSnippet < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :programs
  has_and_belongs_to_many :companies

  validates :text, presence: true
  validates_associated :companies

  scope :by_tag, order('tag_id ASC')
  scope :by_date, order('event_date DESC ')
  scope :by_date_r, order('event_date ASC')
  scope :by_update_date, order('updated_at DESC')

  attr_accessible :text, :tag_ids, :program_ids, :company_ids

  def to_s
    self.text
  end
end
