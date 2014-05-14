class CreateJoinTableInfoSnippetTag < ActiveRecord::Migration
  def change
    create_table :info_snippets_tags, :id => false do |t|
      t.references :info_snippet, :null => false
      t.references :tag, :null => false
    end

    add_index(:info_snippets_tags, [:info_snippet_id, :tag_id], :unique => true)
  end
end
