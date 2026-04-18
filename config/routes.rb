Rails.application.routes.draw do
  get "home/index"
  devise_for :admin_users
  resources :blogs
  resources :projects
  resources :courses
 # resources :students
  root "home#index"

  namespace :admin do
  get  "dashboard" , to: "dashboard#index"
    resources :students
  end


end
