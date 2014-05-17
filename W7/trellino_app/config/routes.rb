Rails.application.routes.draw do

  root 'static_pages#home'
  
  resources :boards, only: [:create, :destroy, :show, :index] do
    resources :lists, only: :index
  end
  
  resources :lists, only: [:create, :destroy]
  
  resources :lists, only: :show do
    resources :cards, only: :index
  end
  
  resources :cards, only: [:create, :destroy, :show]

end
