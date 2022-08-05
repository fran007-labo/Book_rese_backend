Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      namespace :users do
        resources :registrations, only: [:create]
        resources :sign_outs    , only: [:create]
      end
      
      namespace :reservations do
        resources :registrations, only: [:show, :create]
        resources :add_books, only: [:create]
        resources :remove_books, only: [:create]
      end
    resources :books        , only: [:index, :create, :update, :destroy]
    end
  end
end
