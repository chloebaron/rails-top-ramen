Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ramens, only: [:index, :show, :new, :create, :destroy] do
    resources :favourites, only: [:new, :create]
  end

  resources :favourites, only: [:index, :show]
end
