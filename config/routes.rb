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
  resources :contents
  resources :movies, only: [:index]
  resources :texts, only: [:index, :show]
  resources :lines
  resources :moneys
  resources :salons, only: :index
  resources :designs
  resources :questions, only: [:index, :show, :create, :edit, :update]
  resources :questions do
    resource :solutions, only: [:create]
  end
end
