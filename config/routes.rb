Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # root "posts#index"
  devise_scope :user do
    root "devise/sessions#new"
    resources :posts do
      resources :comments, shallow: true
    end
  end
  resources :profiles, only: :show
end
