class AddDebtToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :debt, :float
  end
end
