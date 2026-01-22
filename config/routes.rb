# Rails.application.routes.draw do
# get "author/index"
# get "author/show"
# get "author/edit"
# get "author/update"
# get "author/new"
# get "author/create"
# get "author/destroy"
# get "dashboard/index"
#   get "home/index"
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check

#   # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
#   # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
#   # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

#   # Defines the root path route ("/")
#   # root "posts#index"
# end

Rails.application.routes.draw do
  root "home#index"
  get "/dashboard", to: "dashboard#index"
  # get "/books", to: "books#index"
  # get "/books/show", to: "books#show"
  # post "/books/create", to: "books#create"
  # get "/books/new", to: "books#new"
  resources :books
  resources :authors
end
