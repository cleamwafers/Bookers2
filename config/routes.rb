Rails.application.routes.draw do
  get '/' => 'homes#top'
  get '/homes/about' => 'homes#about'
  get '/users/sign_up' => ''
  get '/users/sign_in' => ''
  get '/users' => ''
  get '/books' => 'books#index'
  
 devise_for :users

resources :books, only: [:new, :create, :index, :show, :destroy]

 end