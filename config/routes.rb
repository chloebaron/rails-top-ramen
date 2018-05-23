Rails.application.routes.draw do
  get '/dashboard', to: 'users#dashboard', as: :dashboard

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ramens, only: [:index, :show, :new, :create, :destroy] do
    resources :favourites, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :favourites, only: [:update, :destroy, :index, :show]
  resources :reviews,   only: [:destroy]
  # resources :favourites, only: [:index, :show]
  # should not be duplicated
end
