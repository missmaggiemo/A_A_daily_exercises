Rails.application.routes.draw do

  root 'static_pages#home'
  
  resources :boards, only: [:create, :destroy, :show, :index] do
    resources :lists, only: :index
  end
  
  resources :lists, only: [:create, :destroy, :show]

end
