class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :price
      t.integer :'52_week_high'
      t.integer :'52_week_low'
      t.integer :cash
      t.integer :market_cap
      t.integer :shares_out
      t.integer :burn
      t.string :runway

      t.timestamps
    end
  end
end
