Rails.application.routes.draw do
  root "pages#home"
  
  # get 'gigs/new'
  # get 'gigs/create'
  # get 'gigs/edit'
  # get 'gigs/update'
  # get 'gigs/show'
  resources :gigs do
    member do
      delete :delete_path
      post :upload_path
    end
  end
  

   get '/dashboard', to: 'users#dashboard'
   get 'users/:id', to: 'users#show'
   post 'users/edit', to: 'users#update' #users_edit_path

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users,
  path: '',
  path_names:{sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  #resources :users
end
 