Rails.application.routes.draw do

  root to: "cats#index"

  resources :cats

  resources :cat_rental_requests do
    post 'approve', on: :member
    post 'deny', on: :member
  end

  resources :users

  resource :session

end
