Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard"

  resources :treatments, only: [:index, :show, :new, :create] do
    resources :patients, only: [:new, :create] do
      resources :medical_reports, only:[:new, :create]
    end
  end
  resources :medical_reports, only: [:show]
  resources :patients, only: [:show]
end
