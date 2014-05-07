class CreateInfoSnippets < ActiveRecord::Migration
  def change
    create_table :info_snippets do |t|
      t.text :text

      t.timestamps
    end
  end
end
