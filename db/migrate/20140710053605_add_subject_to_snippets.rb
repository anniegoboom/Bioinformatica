class AddSubjectToSnippets < ActiveRecord::Migration
  def change
    add_column :info_snippets, :subject, :text
  end
end
