SampleApp::Application.routes.draw do
  resources :document_list_requests

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions,      only: [:new, :create, :destroy]
  resources :microposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  root to: 'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/newsfeed', to: 'newsfeed#create', via: 'get'
  match '/hello', to: 'newsfeed#hello', via: 'get'
  match '/update', to: 'newsfeed#update', via: 'get'
  match '/rateCelebrity', to: 'newsfeed#rateCelebrity', via: 'get'
end
