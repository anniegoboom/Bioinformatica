class AddDateToInfoSnippets < ActiveRecord::Migration
  def change
    add_column :info_snippets, :event_date, :date
  end
end
