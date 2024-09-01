Rails.application.routes.draw do
  devise_for :doctors, controllers: { registrations: 'doctors/registrations' }

  root to: 'doctors/sessions#new'
  # root to: 'doctors/registrations#new'
  # root to: 'api/v1/patients#index'

  get 'dashboard', to: 'api/v1/patients#index', as: :doctor_dashboard
  resources :doctors, only: [:index, :show, :edit, :update]

  namespace :api do
    namespace :v1 do
      resources :patients, only: [:index, :update]
      post 'sync', to: 'sync#create'
    end
  end
end
