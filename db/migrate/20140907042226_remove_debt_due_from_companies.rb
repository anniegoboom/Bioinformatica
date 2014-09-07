class RemoveDebtDueFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :debt_due
  end
end
