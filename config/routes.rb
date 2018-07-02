Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :local_storages
  resources :users
  resources :medicines
  
  get '/login' => 'users#login'

  root to: 'users#index'

end
