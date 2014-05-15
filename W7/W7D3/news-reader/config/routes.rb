NewReader::Application.routes.draw do
  resources :feeds, only: [:index, :create, :show] do
    resources :entries, only: [:index]
  end

  # entries?

  root to: "feeds#index"
end
