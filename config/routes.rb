Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  resources :questions
  resources :users do
    member do
      get :recommendations
    end
  end
  resources :job_type
end
