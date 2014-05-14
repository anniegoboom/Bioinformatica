class AddTagIdToInfoSnippet < ActiveRecord::Migration
  def change
    add_column :info_snippets, :tag_id, :integer
  end
end
