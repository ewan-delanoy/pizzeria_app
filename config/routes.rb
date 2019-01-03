Rails.application.routes.draw do
  root 'welcome#users'
  get '/admin', to: 'welcome#admins'
  resources :orders
  get '/users/index', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
