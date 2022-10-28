Rails.application.routes.draw do
  get '/' => 'homes#top'
  get '/home/about' => 'homes#about'
 

 devise_for :users

resources :books, only: [:new, :create, :index, :show, :destroy]

 end