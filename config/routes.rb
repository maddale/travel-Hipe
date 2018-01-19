Rails.application.routes.draw do
  

  # get 'posts/index'

  # get 'posts/new'

  # get 'posts/create'

  # get 'posts/show'

  # get 'posts/update'

  # get 'posts/destroy'

  root 'static_pages#home'
resources :tags, only: [:show, :index] 
resources :users do
  resources :messages, only: [:new, :create, :show, :index, :destroy]
  resources :categories 
  resources :posts  
  
    member do
	get :following, :followers
	end
end
resources :posts, only: [:show, :index]
resources :categories, only: [:index]
resources :sessions, only: [:new, :create]
resources :microposts, only: [:create, :destroy]
resources :relationships, only: [:create, :destroy]

match '/help', to: "static_pages#help" , via: 'get'
match '/about', to: "static_pages#about" , via: 'get'
match '/contact', to: "static_pages#contact" , via: 'get'
match '/signup', to: "users#new", via: 'get'
match '/signin', to: "sessions#new", via: 'get'
match '/signout', to: "sessions#destroy", via: 'delete' 

get 'users/:user_id/messages/dialogue/:opponent_id', to: "messages#index", as: :after_delete


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end