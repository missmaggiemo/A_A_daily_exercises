Rails.application.routes.draw do

  namespace :api, :defaults => { :format => :json } do
    resources :posts, :only => [:create, :destroy, :index, :show, :update]
  end

  root :to => "static_pages#root"
end
