Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  resources :questions do
    resources :answers
  end

  resources :users do
    member do
      get :recommendations
    end
  end
  resources :job_types
  resources :job_programs
end
