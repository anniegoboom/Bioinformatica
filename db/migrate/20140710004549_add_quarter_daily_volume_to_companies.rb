class AddQuarterDailyVolumeToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :three_month_volume, :integer
  end
end
