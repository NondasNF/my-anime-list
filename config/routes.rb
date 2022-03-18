Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :animes do
    put :favorite, on: :member
  end
  get '/favorites', to: 'favorite_anime#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
