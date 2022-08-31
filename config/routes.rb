Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard"

  resources :treatments, only: [:index, :show, :new, :create]

  resources :patients, only: [:new, :create, :show, :report]
end
