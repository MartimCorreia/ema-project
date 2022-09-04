Rails.application.routes.draw do
  devise_for :users
  root to: "pages#intro"
  get "dashboard", to: "pages#dashboard"

  resources :treatments, only: [:index, :show, :new, :create] do
    resources :patients, only: [:new, :create] do
      resources :medical_reports, only:[:new, :create]
    end
  end
  resources :procedures, only: [:index]
  resources :medical_reports, only: [:show, :index]
  resources :patients, only: [:show, :index]
end
