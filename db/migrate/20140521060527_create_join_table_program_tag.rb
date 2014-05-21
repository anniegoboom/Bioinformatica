class CreateJoinTableProgramTag < ActiveRecord::Migration
  def change
    create_table :programs_tags, :id => false do |t|
      t.references :program, :null => false
      t.references :tag, :null => false
    end

    add_index(:programs_tags, [:program_id, :tag_id], :unique => true)
  end
end
