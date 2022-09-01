Rails.application.routes.draw do
  devise_for :accounts
  root to: "accounts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :accounts, only: %i[index]

  resources :profiles do
    resources :profile_tasks, only: %i[index update edit]
    resources :packings, only: %i[show new create edit update destroy]
    resources :meals, only: %i[index destroy]
  end
  resources :task_templates, only: %i[create index update destroy]
  resources :profile_tasks, only: %i[destroy] do
    collection do
      post 'create_multiple'
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
