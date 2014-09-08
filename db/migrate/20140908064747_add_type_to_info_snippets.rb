class AddTypeToInfoSnippets < ActiveRecord::Migration
  def change
    add_column :info_snippets, :timeline_snippet, :boolean, :default => false
  end
end
