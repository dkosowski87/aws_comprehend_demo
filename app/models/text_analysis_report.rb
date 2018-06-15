class TextAnalysisReport < ApplicationRecord
  belongs_to :anylysable, polymorphic: true
  has_one :sentiment_report
  has_one :keywords_report
end
