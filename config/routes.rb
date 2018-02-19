Rails.application.routes.draw do
  get '/' => 'users#welcome'
  resources :users, :attractions
  resources :sessions, only: [:create, :destroy]
  resources :rides, only: [:create]
  get '/signin' => 'sessions#new'

  root 'users#welcome'
end
