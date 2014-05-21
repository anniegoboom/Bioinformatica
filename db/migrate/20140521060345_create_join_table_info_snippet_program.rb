class CreateJoinTableInfoSnippetProgram < ActiveRecord::Migration
  def change
    create_table :info_snippets_programs, :id => false do |t|
      t.references :info_snippet, :null => false
      t.references :program, :null => false
    end

    add_index(:info_snippets_programs, [:info_snippet_id, :program_id], :unique => true)
  end
end
