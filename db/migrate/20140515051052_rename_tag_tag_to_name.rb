class RenameTagTagToName < ActiveRecord::Migration
  def change
    rename_column :tags, :tag, :name
  end
end
