class ChangeIntegersToFloatsInCompanies < ActiveRecord::Migration
  def up
    change_column :companies, :price, :float
    change_column :companies, :'52_week_high', :float
    change_column :companies, :'52_week_low', :float
    change_column :companies, :shares_out, :float
  end

  def down
    change_column :companies, :price, :integer
    change_column :companies, :'52_week_high', :integer
    change_column :companies, :'52_week_low', :integer
    change_column :companies, :shares_out, :integer
  end
end
