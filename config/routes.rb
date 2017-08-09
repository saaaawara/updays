Rails.application.routes.draw do

  root 'application#root'

  namespace  :api, {format: 'json'} do
    namespace :v1 do
      get '/signup', to: 'users#new'
      post '/signup', to: 'users#create'
      # なぜか反映されなかった
      # delete '/signout', to: 'users#destroy'

      get '/login', to: 'sessions#new'
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'

      resources :users
      resources :sessions
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
