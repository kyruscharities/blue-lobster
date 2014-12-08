Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  resources :questions
  resources :users
  resources :job_type
end
