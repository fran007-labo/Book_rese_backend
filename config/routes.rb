Rails.application.routes.draw do
  namespace :api do 
    resources :health_check, only: :index
    
    namespace :v1 do
      namespace :users do
        resources :registrations, only: [:create]
        resources :sign_outs    , only: [:create]
      end

      resources :books        , only: [:index, :create, :update, :destroy] do
        scope module: :carts do
          resources :add_books, only: [:create]
          resources :remove_books, only: [:create]
        end
      end

    end
  end
end
