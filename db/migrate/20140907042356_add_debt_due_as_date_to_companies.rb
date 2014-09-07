class AddDebtDueAsDateToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :debt_due, :date
  end
end
