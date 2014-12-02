Rails.application.routes.draw do

  resources :system_administrators
  resources :office_workers
  resources :physicians
  resources :diagnostic_codes

  resources :appointments do
    collection do
      get "physician"
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