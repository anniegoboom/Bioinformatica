class RemovePrecalculatedFieldsFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :market_cap
    remove_column :companies, :runway
  end
end
