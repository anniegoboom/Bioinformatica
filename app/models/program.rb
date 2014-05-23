class Program < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :companies
  has_and_belongs_to_many :info_snippets

  scope :by_name, order('name ASC')

  validates :name, presence: true
  validates_associated :companies
  validates_associated :info_snippets

  attr_accessible :description, :name, :company_ids, :info_snippet_ids, :tag_ids
end
