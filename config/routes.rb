Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :local_storages
  resources :users
  resources :medicines
  resources :dashboards
  resources :patients


  post '/users/login', to: 'users#login'
  post '/sign_up', to: 'users#sign_up'
  root to: 'dashboards#sign_in'

end
