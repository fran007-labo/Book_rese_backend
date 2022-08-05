Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      namespace :users do
        resources :registrations, only: [:create]
        resources :sign_outs    , only: [:create]
      end
      
    resources :books        , only: [:index, :create, :update, :destroy]
    end
  end
end
