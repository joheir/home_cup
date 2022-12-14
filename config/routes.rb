Rails.application.routes.draw do
  devise_for :accounts
  root to: "accounts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :accounts, only: %i[index]

  resources :profiles do
    collection do
      get 'progresses', to: "profiles#progresses"
    end
  end

  resources :profiles do
    resources :chats, only: %i[new create update edit index destroy]
    resources :profile_tasks, only: %i[index update edit]
    resources :packings
    resources :meals, only: %i[index new create destroy] do
      member do
        patch 'vote', to: "meals#vote"
      end
      collection do
        get 'search', to: "meals#search"
      end
    end
    resources :profiles do
      collection do
        get 'progresses', to: "profiles#progresses"
      end
    end
  end

  resources :meals do
    collection do
      delete 'destroy_all', to: "meals#destroy_all"
    end
  end

  resources :task_templates, only: %i[create index update destroy new]
  resources :profile_tasks, only: %i[destroy] do
    collection do
      post 'create_multiple'
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
