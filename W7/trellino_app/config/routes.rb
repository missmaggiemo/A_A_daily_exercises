Rails.application.routes.draw do

  root 'static_pages#home'
  
  resources :boards, only: [:create, :destroy, :show, :index]


end
