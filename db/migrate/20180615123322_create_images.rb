class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :name
      t.references :entry, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
