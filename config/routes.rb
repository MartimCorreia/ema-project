Rails.application.routes.draw do
  devise_for :users
  root to: "treatments#index"
  get "dashboard", to: "pages#dashboard"

  resources :treatment, only: [:index, :show, :new, :create]

  resources :patients, only: [:new, :create, :show, :report]
end
