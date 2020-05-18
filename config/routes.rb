Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :create] do
        get 'me', to: 'users#me', on: :collection
      end
      resources :sessions, only: :create
    end
  end
end
