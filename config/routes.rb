Rails.application.routes.draw do
  resources :journals, only: %i(new create show) do
    resources :entries, only: %i(new create) do
      resource :text_analysis_report, only: %i(show)
    end
    resources :entries_reports, only: %i(index)
  end
end
