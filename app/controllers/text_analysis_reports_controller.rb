class TextAnalysisReportsController < ApplicationController
  def index
    reports = entries_reports
  end

  def show
  end

  private

  def journal
    @journal ||= Journal.find(params[:journal_id])
  end

  def entries_reports
    @entries ||= journal.entries_reports
  end

  def find_report
    @report = @entry.text_analysis_report
  end
end
