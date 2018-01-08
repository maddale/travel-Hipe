Rails.application.routes.draw do
  root 'static_pages#home'
 
resources :users

resources :sessions, only: [:new, :create]
resources :microposts, only: [:create, :destroy]

match '/help', to: "static_pages#help" , via: 'get'
match '/about', to: "static_pages#about" , via: 'get'
match '/contact', to: "static_pages#contact" , via: 'get'
match '/signup', to: "users#new", via: 'get'
match '/signin', to: "sessions#new", via: 'get'
match '/signout', to: "sessions#destroy", via: 'delete' 




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end