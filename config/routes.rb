Rails.application.routes.draw do

  root 'root#root'

  resources :users, only: [:create, :new]
  resource :session, only: [:create, :new, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :categories, only: [:index, :show]
    resources :projects, except: :destroy do
      resources :pledges, only: [:create, :index]
      resources :rewards, only: [:create, :index, :show]
      resources :comments, only: [:create, :index, :show]
      resource :starter, only: :show
    end
  end
end
