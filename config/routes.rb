Rails.application.routes.draw do
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
    end
  end

  resources :job_types

  resources :job_programs

  namespace :admin do
    get :update_styles
  end
  resources :skill_values
end
