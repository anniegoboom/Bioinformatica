class Company < ActiveRecord::Base
  has_and_belongs_to_many :programs
  has_and_belongs_to_many :info_snippets

  attr_accessible :name, :price, :'52_week_high', :'52_week_low', :cash,
                  :market_cap, :shares_out, :burn, :runway,
                  :info_snippet_ids, :program_ids
end
