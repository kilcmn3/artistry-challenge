Rails.application.routes.draw do
  root to: 'artists#index'

  resources :artists, only: [:index, :show, :new, :create ]
  resources :instruments, only: [:index]
  resources :artist_instruments, only: [:new, :create]
end
