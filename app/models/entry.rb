class Entry < ApplicationRecord
  belongs_to :journal
  has_one :text_anylysis_report, as: :analysable
end
