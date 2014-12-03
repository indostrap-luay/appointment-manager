Rails.application.routes.draw do

  resources :office_workers
  resources :physicians
  resources :diagnostic_codes

  resources :appointments do
    collection do
      get "physician"
      get "invoice"
    end

    member do
      get   "insert_diagnostic"
      patch "update_diagnostic"
      get   "new_invoice"
      patch "update_invoice"
      get   "show_invoice"
    end
  end

  resources :system_administrators do
    collection do
      get "appointments_report"
    end
  end

  devise_for :users, controllers: {
    registrations:      "users/registrations",
    sessions:           "users/sessions",
    confirmations:      "users/confirmations"
  }

  resources  :patients

  root 'landing_pages#index'
end