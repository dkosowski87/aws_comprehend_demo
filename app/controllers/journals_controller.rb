class JournalsController < ApplicationController
  def new
    @journal = Journal.new
  end

  def create
    journal = Journal.create!(journal_params)
    redirect_to new_journal_entry_path(journal)
  end

  def show
    
  end

  private

  def journal_params
    params.require(:journal).permit(:name)
  end
end
