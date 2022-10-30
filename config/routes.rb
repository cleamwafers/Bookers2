Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  root to: "homes#top"
  get '/home/about' => 'homes#about'
  get '/books' => 'book#index'


 devise_for :users

resources :books, only: [:new, :create, :index, :show, :destroy]

 end