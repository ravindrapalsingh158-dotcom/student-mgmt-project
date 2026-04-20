Rails.application.routes.draw do
  get "home/index"
  devise_for :admin_users , controllers: { sessions: "admin_users/sessions" , registrations: "admin_users/registrations" , passwords: "admin_users/passwords" }
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
