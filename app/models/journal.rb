class Journal < ApplicationRecord
  has_many :entries
  has_many :text_anylysis_reports, as: :analysable
end
