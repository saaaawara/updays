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

      # daily
      post '/upload/:user_id', to: 'dailies#upload'
      post 'test_create', to: 'dailies#test_create'
      delete '/dailies', to: 'dailies#destroy'

      # event
      delete '/events', to: 'events#destroy'

      # crawler
      post '/crawler', to: 'crawler#crawler'
      post '/search', to: 'crawler#search'
      post '/event_ai', to: 'crawler#event_ai'
      get '/timer', to: 'crawler#timer'
      post '/send_mail', to: 'crawler#send_mail'

      # image
      get '/images', to: 'images#index'
      post '/images', to: 'images#create'
      delete '/images', to: 'images#destroy'
      post '/hash_tag', to: 'images#hash_tag'

      resources :users
      resources :sessions
      resources :schedules, except: :destroy
      resources :dailies, except: :destroy
      resources :events, except: :destroy

      # delete '/schedule', to: 'schedules#destroy'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
