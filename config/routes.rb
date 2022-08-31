Rails.application.routes.draw do
  devise_for :accounts
  root to: "accounts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :accounts, only: %i[index]
  resources :task_templates
  resources :meals, only: %i[index destroy]
  resources :profiles do
    resources :profile_tasks, only: %i[index update edit]
    resources :packings, only: %i[show new create edit update destroy]
  end
  resources :profile_tasks, only: %i[destroy] do
    collection do
      post 'create_multiple'
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
