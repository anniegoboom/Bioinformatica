class Company < ActiveRecord::Base
  has_and_belongs_to_many :programs
  has_and_belongs_to_many :info_snippets

  validate :has_name_or_ticker

  scope :by_name, order('name ASC')

  validates_numericality_of :'52_week_high', allow_nil: true, greater_than: :'52_week_low', :if => Proc.new {|company| company['52_week_high'].present? && company['52_week_low'].present? }, message: 'cannot be less than 52 week low'
  validates_numericality_of :price, allow_nil: true
  validates_numericality_of :cash, allow_nil: true
  validates_numericality_of :shares_out, allow_nil: true
  validates_numericality_of :burn, allow_nil: true
  validates_numericality_of :three_month_volume, allow_nil: true
  validates_numericality_of :debt, allow_nil: true
  validates_numericality_of :debt_due, allow_nil: true

  attr_accessible :name, :ticker, :price, :'52_week_high', :'52_week_low', :cash,
                  :shares_out, :burn, :three_month_volume, :debt, :debt_due,
                  :info_snippet_ids, :program_ids, :three_month_volume, :other
end

def has_name_or_ticker
  if [self.name, self.ticker].reject(&:blank?).size == 0
    errors[:base] << ("Company requires either a name or a ticker")
  end
end
