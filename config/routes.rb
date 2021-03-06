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
  resources :messages, only: [:new, :create, :index, :destroy]
  resources :photos, only: [:new, :create]
  resources :posts, only: [:new, :create, :edit, :update, :destroy]
  
    member do
	get :following, :followers
	end
end
resources :posts, only: [:show, :index]
resources :sessions, only: [:new, :create]
resources :microposts, only: [:create, :destroy]
resources :relationships, only: [:create, :destroy]
resources :categories, only: [:index, :show]
match '/help', to: "static_pages#help" , via: 'get'
match '/about', to: "static_pages#about" , via: 'get'
match '/contact', to: "static_pages#contact" , via: 'get'
match '/signup', to: "users#new", via: 'get'
match '/signin', to: "sessions#new", via: 'get'
match '/signout', to: "sessions#destroy", via: 'delete' 

get 'users/:user_id/messages/dialogue/:opponent_id', to: "messages#index", as: :after_delete
get 'users/:id/edit_avatar', to: "users#edit_avatar", as: :user_edit_avatar
get 'users/:user_id/messages/:opp_id', to: "messages#show", as: :user_talk
patch 'users/:id/update_avatar', to: "users#update_avatar"
patch 'users/:id/resize_avatar', to: "users#resize_avatar"
get 'users/:user_id/posts/:id/gallery', to:"posts#gallery", as: :gallery
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end