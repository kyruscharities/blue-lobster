Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  resources :answers, only: [:create, :update]
  resources :questions
  resources :users do
    member do
      get :recommendations
    end
  end
  resources :job_types
  resources :job_programs
end
