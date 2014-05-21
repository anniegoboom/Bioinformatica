class CreateJoinTableCompanyInfoSnippet < ActiveRecord::Migration
  def change
    create_table :companies_info_snippets, :id => false do |t|
      t.references :company, :null => false
      t.references :info_snippet, :null => false
    end

    add_index(:companies_info_snippets, [:info_snippet_id, :company_id], :unique => true)
  end
end
