class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.references :journal, null: false, index: true, foreign_key: true
      t.string :title, null: false
      t.text :text, null: false
      t.timestamps
    end
  end
end
