Rails.application.routes.draw do
  get 'admin/update_styles'

  root to: 'visitors#index'
  devise_for :users

  resources :questions

  resources :users do
    member do
      get :recommendations
    end
  end

  resources :job_types

  resources :job_programs

  namespace :admin do
    get :update_styles
  end
end
