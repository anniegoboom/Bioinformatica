class AddDebtDueToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :debt_due, :integer
  end
end
