Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'authenticate', to: 'authentication#authenticate'
      resources :users, only: [:create]
      resources :transactions, only: [:index, :show, :create, :update]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
