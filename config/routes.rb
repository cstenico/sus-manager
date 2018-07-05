Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :local_storages
  resources :users
  resources :medicines
  resources :dashboards
  resources :patients
  resources :stocks
  resources :checkouts
  resources :shipments

  get '/checkout/storage', to: 'checkouts#select_unit'
  get '/checkout/medicine', to: 'checkouts#select_medicine'
  get '/shipment/storage', to: 'shipments#select_unit'
  get '/shipment/medicine', to: 'shipments#select_medicine'
  post '/users/login', to: 'users#login'
  post '/sign_up', to: 'users#sign_up'
  get '/search_ubs', to: 'local_storages#ask_local'
  post '/query_results', to: 'local_storages#query_results'
  get '/search_medicine', to: 'medicines#ask_local'
  post 'medicines/query_results', to: 'medicines#query_results'

  root to: 'dashboards#sign_in'

end
