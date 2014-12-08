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

<<<<<<< HEAD
  resources :job_programs

  namespace :admin do
    get :update_styles
  end
=======
  resources :skill_values
>>>>>>> very ugly view to be able to assign skill values to questions
end
