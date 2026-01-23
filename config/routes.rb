# Rails.application.routes.draw do
# get "password_resets/new"
# get "password_resets/create"
# get "password_resets/edit"
# get "password_resets/update"
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
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get  "/password_resets/new",     to: "password_resets#new",    as: :new_password_reset
  post "/password_resets",         to: "password_resets#create", as: :password_resets
  get  "/password_resets/:token/edit", to: "password_resets#edit", as: :edit_password_reset
  patch "/password_resets/:token", to: "password_resets#update", as: :password_reset

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
