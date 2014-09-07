class RenameSecFilingsToOtherInCompanies < ActiveRecord::Migration
  def change
    rename_column :companies, :sec_filings, :other
  end
end
