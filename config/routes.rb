Rails.application.routes.draw do

  # users routes
  get "/signup", to: "users#new"
  get "/profile", to: "users#show"
  resources :users, only: [:create]

  # sessions routes
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  # post "/sessions", to: "sessions#create"
  resources :sessions, only: [:create]

  resources :posts, except: [:index]

  root "posts#index"
  
end
#    Prefix Verb   URI Pattern               Controller#Action
#    signup GET    /signup(.:format)         users#new
#   profile GET    /profile(.:format)        users#show
#     users POST   /users(.:format)          users#create
#     login GET    /login(.:format)          sessions#new
#    logout GET    /logout(.:format)         sessions#destroy
#  sessions POST   /sessions(.:format)       sessions#create
#     posts POST   /posts(.:format)          posts#create
#  new_post GET    /posts/new(.:format)      posts#new
# edit_post GET    /posts/:id/edit(.:format) posts#edit
#      post GET    /posts/:id(.:format)      posts#show
#           PATCH  /posts/:id(.:format)      posts#update
#           PUT    /posts/:id(.:format)      posts#update
#           DELETE /posts/:id(.:format)      posts#destroy
#      root GET    /   