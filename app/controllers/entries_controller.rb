class EntriesController < ApplicationController
  def new
    journal
    @entry = Entry.new
  end

  def create
    entry = Entry.create!(journal: journal, title: entry_params[:title], text: entry_params[:text])
    service = ::Entries::Analyse.call(entry: entry)

    if service.success?
      redirect_to journal_entry_text_analysis_report_path(journal, entry)
    else
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :text)
  end

  def journal
    @journal ||= Journal.find(params[:journal_id])
  end
end
