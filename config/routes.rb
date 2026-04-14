Rails.application.routes.draw do
  resources :blogs
  resources :projects
  resources :courses
  resources :students

namespace :admin do
    resources :students
  end

end
