Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :registrations, only: [:create]
      resources :sign_outs    , only: [:create]
    end
  end
end
