Rails.application.routes.draw do
  # devise_for :users
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :people, only: [:index, :new, :create], module: 'admin' do
      # route to the show and create page that need the person as a parameter
        resources :quotes, only: [ :show, :create ], param: :slug do
          member do
            get :all, to: 'quotes#all'
          end
        end
        resources :quotes, only: [ :update, :destroy]
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
