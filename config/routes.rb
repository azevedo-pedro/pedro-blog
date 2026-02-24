Rails.application.routes.draw do
  devise_for :admins, path: "admin", controllers: { sessions: "admins/sessions" }

  namespace :dashboard, path: "admin" do
    root to: "posts#index"
    resources :posts
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "posts#index"
  get "/about",      to: "pages#about",  as: :about
  get "/search",     to: "posts#search", as: :search
  get "/page/:page", to: "posts#index",  as: :posts_page, constraints: { page: /\d+/ }
  resources :posts, only: [ :show ], path: "/"
end
