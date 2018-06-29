class Entry < ApplicationRecord
  belongs_to :journal
  has_one :text_analysis_report, as: :analysable
  has_one :image
end
