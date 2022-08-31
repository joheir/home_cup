Rails.application.routes.draw do
  get 'meals/index'
  get 'meals/destroy'
  devise_for :accounts
  root to: "accounts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :accounts, only: %i[index]
  resources :profiles
  resources :task_templates
  resources :meals, only: %i[index destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
