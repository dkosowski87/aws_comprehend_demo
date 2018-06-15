class CreateKeywordsReports < ActiveRecord::Migration[5.1]
  def change
    create_table :keywords_reports do |t|
      t.references :text_analysis_report, index: true, foreign_key: true, null: false
      t.string :keywords, array: true, default: [], null: false
      t.timestamps
    end
  end
end
