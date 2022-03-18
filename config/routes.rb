Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :animes do
    put :follow, on: :member
    put :favorite, on: :member
    put :unfollow, on: :member
    put :unfavorite, on: :member
    put :follow_and_favorite, on: :member
  end
  get '/followed', to: 'follow_anime#index'
  get '/favorites', to: 'follow_anime#favorites'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
