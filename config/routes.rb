Rails.application.routes.draw do
  devise_for :users
  root to: "pages#intro"
  get "dashboard", to: "pages#dashboard"

  resources :treatments, only: [:index, :show, :new, :create] do
    resources :patients, only: [:new, :create]
  end

  resources :patients, only: [:show ,:report]
end
