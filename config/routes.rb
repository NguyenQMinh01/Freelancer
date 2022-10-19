Rails.application.routes.draw do
  get '/dashboard', to: 'users#dashboard'

  post 'users/edit', to: 'users#update' #users_edit_path

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
  devise_for :users,controllers: {omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations'}
  resources :users
  
end
 