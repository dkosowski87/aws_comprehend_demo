class TextAnalysisReportsController < ApplicationController
  def index
    entries_reports
  end

  def show
    report
  end

  private

  def journal
    @journal ||= Journal.find(params[:journal_id])
  end

  def entries_reports
    @entries ||= journal.entries_reports
  end

  def entry
    @entry ||= journal.entries.find(params[:entry_id])
  end

  def report
    @report ||= entry.text_analysis_report
  end
end
