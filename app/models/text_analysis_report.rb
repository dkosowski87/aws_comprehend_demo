class TextAnalysisReport < ApplicationRecord
  belongs_to :analysable, polymorphic: true
  has_one :sentiment_report
  has_one :keywords_report
end
