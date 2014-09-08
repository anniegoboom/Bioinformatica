class InfoSnippet < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :programs
  has_and_belongs_to_many :companies

  validates :text, presence: true
  validates_associated :companies
  validates_presence_of :event_date, :if => :timeline_snippet

  scope :by_tag, order('tag_id ASC')
  scope :by_date, order('event_date DESC ')
  scope :by_date_r, order('event_date ASC')
  scope :by_update_date, order('updated_at DESC')

  attr_accessible :text, :subject, :tag_ids, :program_ids, :company_ids,
                  :event_date, :timeline_snippet

  def to_s
    self.text
  end
end
