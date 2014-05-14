class ChangeTypeToName < ActiveRecord::Migration
  def change
    rename_column :tag_types, :type, :name
  end
end
