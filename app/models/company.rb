class Company < ActiveRecord::Base
  has_and_belongs_to_many :programs
  has_and_belongs_to_many :info_snippets

  scope :by_name, order('name ASC')

  validates_numericality_of :'52_week_high', greater_than: :'52_week_low'

  attr_accessible :name, :ticker, :price, :'52_week_high', :'52_week_low', :cash,
                  :market_cap, :shares_out, :burn, :runway,
                  :info_snippet_ids, :program_ids, :three_month_volume, :debt_due
end
