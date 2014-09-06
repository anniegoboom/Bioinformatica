class Company < ActiveRecord::Base
  has_and_belongs_to_many :programs
  has_and_belongs_to_many :info_snippets

  validate :has_name_or_ticker

  scope :by_name, order('name ASC')

  validates_numericality_of :'52_week_high', allow_nil: true, greater_than: :'52_week_low', :if => Proc.new {|company| company['52_week_high'].present? && company['52_week_low'].present? }, message: 'cannot be less than 52 week low'

  attr_accessible :name, :ticker, :price, :'52_week_high', :'52_week_low', :cash,
                  :market_cap, :shares_out, :burn, :runway,
                  :info_snippet_ids, :program_ids, :three_month_volume, :debt_due,
                  :sec_filings
end

def has_name_or_ticker
  if [self.name, self.ticker].reject(&:blank?).size == 0
    errors[:base] << ("Company requires either a name or a ticker")
  end
end
