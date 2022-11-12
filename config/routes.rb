Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    # get 'requests/index'
    # get 'requests/new'
    # get 'requests/edit'
    # get 'requests/list'
    # get 'requests/show'
    root "pages#home"
    # get 'gigs/new'
    # get 'gigs/create'
    # get 'gigs/edit'
    # get 'gigs/update'
    # get 'gigs/show'

    delete 'requests/delete' 
    
    #  get '*path' => redirect('/404.html') #render page 404
    get '/dashboard', to: 'users#dashboard'
    get 'users/:id', to: 'users#show', :as => :user_show #user_show_path
    get '/selling_orders', to: 'orders#selling_orders'
    get '/buying_orders', to: 'orders#buying_orders'
    get '/orders/:id/complete', to: 'orders#complete', as: 'complete_order' #complete_order_path
    get 'all_requests', to: 'requests#list'
    get '/request_offers/:id', to: 'requests#offers', as: 'request_offers'  #request_offers_path
    get '/my_offers', to: 'requests#my_offers'
    get '/search', to: 'pages#search'

    post 'users/edit', to: 'users#update' #users_edit_path
    post '/offers', to: 'offers#create'

    put '/offers/:id/accept', to: 'offers#accept', as: 'accept_offer'
    put '/offers/:id/reject', to: 'offers#reject', as: 'reject_offer'


    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index" 

    resources :gigs do
      member do
        delete :delete_photo
        get :delete_photo  #gigs/15/delete_photo 
        post :upload_photo #gigs/15/upload_photo 
      end
      resources :orders, only: [:create] #gigs/15/orders
    end

    resources :users do
      collection do
        get :confirm_email
      end
    end

    resources :requests
    resources :offers
  end
  devise_for :users,
  path: '',
  #path_names:{sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  resources :users

end
 