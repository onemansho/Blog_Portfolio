Rails.application.routes.draw do
  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout", sign_up: "register" }


  resources :portfolios, except: [ :show ]

  get "angular_items", to: "portfolios#angular"
  get "portfolio/:id", to: "portfolios#show", as: "portfolio_show"
  get "portfolios/:id", to: "portfolios#show"

  #get "pages/home"
  #get "pages/about"
  #get "pages/contact"

  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  post 'portfolios/sort', to: 'portfolios#sort'

end
