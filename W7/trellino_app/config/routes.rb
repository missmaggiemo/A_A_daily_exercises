Rails.application.routes.draw do

  root 'static_pages#home'
  
  post 'boards/update_order', to: 'boards#update_order'
  
  post 'lists/update_order', to: 'lists#update_order'
  
  post 'cards/update_order', to: 'cards#update_order'
  
  resources :boards, only: [:create, :destroy, :show, :index] do
    resources :lists, only: :index
  end
  
  resources :lists, only: [:create, :destroy]
  
  resources :lists, only: :show do
    resources :cards, only: :index
  end
  
  resources :cards, only: [:create, :destroy, :show]

end
