class Journal < ApplicationRecord
  has_many :entries
  has_many :text_anylysis_reports, as: :analysable
  has_many :entries_reports, class_name: 'TextAnalysisReport', through: :entries, source: :text_analysis_report
end
