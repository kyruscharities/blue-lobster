Rails.application.routes.draw do
  resources :certifications

  resources :military_job_codes

  get 'admin/update_styles'

  root to: 'visitors#index'
  devise_for :users

  resources :questions do
    resources :answers
  end

  get '/profile' => 'users#profile'

  resources :users do
    member do
      get :recommendations
      get :skills
      get :profile
    end
  end

  resources :job_types

  resources :job_programs

  namespace :admin do
    get :update_styles
  end
  resources :skill_values
end
