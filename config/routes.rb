Rails.application.routes.draw do
  root 'welcome#users'
  get '/admin', to: 'welcome#admins'
  resources :orders
  get 'signup', to: 'users#new'
  resources :users, only: [:show,:index,:new,:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
