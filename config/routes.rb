Rails.application.routes.draw do
  root to: "movies#index"

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :aws, only: [:index, :show]
  resources :users_webs
  resources :words
  resources :movies, only: [:index] do
    resource :watched_movies, only: [:create, :destroy]
  end
  resources :texts, only: [:index, :show] do
    resource :read_texts, only: [:create, :destroy]
  end
  resources :lines, only: [:index, :show]
  resources :salons, only: :index
  resources :questions, only: [:index, :show, :create, :edit, :update]
  resources :questions do
    resource :solutions, only: [:create]
  end
end
