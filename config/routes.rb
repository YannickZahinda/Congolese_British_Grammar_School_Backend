Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :v1 do
    resources :students, only: [:index, :create, :show, :destroy]
    resources :events, only: [:index, :create, :show, :destroy]
    resources :parents, only: [:index, :create, :show, :destroy]
    resources :teachers, only: [:index, :create, :show, :destroy]
  end

end
