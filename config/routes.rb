Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  get '/current_user', to: 'current_user#index'

  namespace :v1 do
    resources :students, only: [:index, :create, :show, :update, :destroy]
    resources :events, only: [:index, :create, :show, :update, :destroy]
    resources :parents, only: [:index, :create, :show, :update, :destroy]
    resources :teachers, only: [:index, :create, :show, :update, :destroy]
  end
end
