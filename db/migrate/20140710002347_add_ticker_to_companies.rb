class AddTickerToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :ticker, :string
  end
end
