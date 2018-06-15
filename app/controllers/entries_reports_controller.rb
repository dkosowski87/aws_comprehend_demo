class EntriesReportsController < ApplicationController
  def index
    @reports = journal.entries_reports
  end

  private

  def journal
    @journal ||= Journal.find(params[:journal_id])
  end
end
