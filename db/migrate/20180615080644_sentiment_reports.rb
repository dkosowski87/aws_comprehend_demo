class SentimentReports < ActiveRecord::Migration[5.1]
  def change
    create_table :sentiment_reports do |t|
      t.references :text_analysis_report, index: true, foreign_key: true, null: false
      t.string :sentiment
      t.decimal :mixed_score
      t.decimal :positive_score
      t.decimal :negative_score
      t.decimal :neutral_score
      t.timestamps
    end
  end
end
