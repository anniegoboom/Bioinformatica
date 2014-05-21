class CreateJoinTableCompanyProgram < ActiveRecord::Migration
  def change
    create_table :companies_programs, :id => false do |t|
      t.references :company, :null => false
      t.references :program, :null => false
    end

    add_index(:companies_programs, [:company_id, :program_id], :unique => true)
  end
end
