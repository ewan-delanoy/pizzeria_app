Rails.application.routes.draw do
  root 'welcome#users'
  get '/admin', to: 'welcome#admins', as: 'welcome_admin'
  resources :orders
  resources :users, only: [:show,:index,:new,:create]
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'adminlogin', to: 'adminsessions#new'
  post 'adminlogin', to: 'adminsessions#create'
  delete 'adminlogout', to: 'adminsessions#destroy'
  get '/users/:user_id/orders', to: 'orders#index_for_user', as: 'orders_of_user'
  get '/orders/:order_id/ajax_show', to: 'orders#ajax_show', as: 'orders_ajax_show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      get :confirm_email
    end
  end
end
