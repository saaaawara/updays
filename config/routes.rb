Rails.application.routes.draw do

  root 'application#root'

  namespace  :api, {format: 'json'} do
    namespace :v1 do
      # users関連
      get '/signup', to: 'users#new'
      post '/signup', to: 'users#create'
      # なぜか反映されなかった
      # delete '/signout', to: 'users#destroy'

      # sessions関連
      get '/login', to: 'sessions#new'
      post '/login', to: 'sessions#create'
      # delete '/logout', to: 'sessions#destroy'

      # schedules関連
      # post '/task', to: 'schedules#create'
      delete '/schedules', to: 'schedules#destroy'

      resources :users
      resources :sessions
      resources :schedules, except: :destroy
      resources :dailies

      # delete '/schedule', to: 'schedules#destroy'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
