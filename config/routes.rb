Rails.application.routes.draw do
  resources :certifications
  resources :veteran_support_goals
  resources :skills
  resources :military_job_codes

  get 'admin/update_styles'

  root to: 'visitors#index'
  devise_for :users

  resources :questions do
    collection do
      get :answer
    end

    resources :answers
  end

  get '/profile' => 'users#profile'
  get '/profile_card' => 'users#profile_card'

  resources :users do
    member do
      get :recommendations
      get :skills
      get :profile
    end
  end

  resources :job_types

  resources :programs do
    member do
      put :publish
      put :unpublish
    end
  end

  namespace :admin do
    get :update_styles
  end
  resources :skill_values
end
