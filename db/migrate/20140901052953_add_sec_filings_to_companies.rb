class AddSecFilingsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :sec_filings, :text
  end
end
