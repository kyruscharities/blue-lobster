Rails.application.routes.draw do

  devise_for :users

  root to: 'users#profile'

  resources :users do
    member do
      get :recommendations
      get :skills
      get :profile
    end
  end

  get '/profile' => 'users#profile'
  get '/profile_card' => 'users#profile_card'

  resources :questions do
    collection do
      get :answer
    end

    resources :answers
  end

  resources :programs do
    member do
      put :publish
      put :unpublish
    end
  end

  resources :organizations do
    resources :programs do
      member do
        put :publish
        put :unpublish
      end
    end
  end

  resources :job_types
  resources :skill_values
  resources :certifications
  resources :veteran_support_goals
  resources :skills
  resources :military_job_codes

  namespace :admin do
    get :update_styles
  end
end
