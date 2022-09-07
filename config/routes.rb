Rails.application.routes.draw do
  devise_for :users

  unauthenticated :user do
    root to: "pages#intro"
  end

  authenticated do
    root to: "pages#dashboard", as: :authenticated_root
  end


  resources :treatments, only: [:index, :show, :new, :create] do
    resources :patients, only: [:new, :create] do
      collection do
        get :select
      end
      resources :medical_reports, only:[:new, :create]
    end
  end
  resources :procedures, only: [:index]
  resources :medical_reports, only: [:show, :index]
  resources :patients, only: [:show, :index]
end
