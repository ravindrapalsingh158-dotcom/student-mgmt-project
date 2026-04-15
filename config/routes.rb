Rails.application.routes.draw do
  get "admin/dashboard"
  devise_for :admin_users
   root "home#index"

  get "student", to: "home#student"
  get "admin", to: "home#admin"


  devise_for :students


 get  'login',  to: 'sessions#new'
post 'login',  to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'
  resources :blogs
  resources :projects
  resources :courses
  resources :students

namespace :admin do
    resources :students
  end

end
