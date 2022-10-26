Rails.application.routes.draw do
  get '/' => 'homes#top'
 devise_for :users

  resources :books, only: [:new, :create, :index, :show, :destroy]

 end