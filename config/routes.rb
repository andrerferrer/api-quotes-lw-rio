Rails.application.routes.draw do
  # devise_for :users
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :quotes, only: [ :show ], param: :slug do
        member do
          get :all, to: 'quotes#all'
        end
      end
      resources :quotes, only: :update
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
