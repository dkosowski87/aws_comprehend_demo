class CreateTextAnalysisReports < ActiveRecord::Migration[5.1]
  def change
    create_table :text_analysis_reports do |t|
      t.references :analysable, polymorphic: true, null: false, index: { name: 'index_text_analysis_reports_on_analysable' }
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.timestamps
    end
  end
end
