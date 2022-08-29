Rails.application.routes.draw do
  get 'profile_tasks/index'
  get 'profile_tasks/edit'
  get 'profile_tasks/update'
  get 'task_templates/index'
  get 'task_templates/new'
  get 'task_templates/create'
  get 'task_templates/edit'
  get 'task_templates/update'
  get 'task_templates/destroy'
  get 'profiles/new'
  get 'profiles/create'
  get 'profiles/show'
  get 'profiles/index'
  get 'profiles/destroy'
  get 'profiles/edit'
  get 'profiles/update'
  get 'accounts/index'
  devise_for :accounts
  root to: "accounts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :accounts, only: %i[index]
  # Defines the root path route ("/")
  # root "articles#index"
end
