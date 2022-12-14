Rails.application.routes.draw do
  namespace :api do 
    resources :health_check, only: :index
    
    namespace :v1 do
      namespace :users do
        resources :registrations, only: [:create]
        resources :sign_outs    , only: [:create]
      end
      
      resources :dashboards, only: [:index]

      # ↓dashboards/users/ownはcurrent_userがどんな本を借りたのか見るため。
      get 'dashboards/users/own', to:  "dashboards#show"

      post 'reservations/:id/return', to: "reservations#return"
    
      scope module: :carts do
        resources :carts, only: [:index]
      end

      resources :check_outs, only: [:create]

      resources :books do
        scope module: :carts do
          resources :add_books, only: [:create]
          resources :remove_books, only: [:create]
        end
      end

    end
  end
end
