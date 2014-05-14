class RemoveTagFromInfoSnippet < ActiveRecord::Migration
  def change
    remove_column :info_snippets, :tag_id
  end
end
