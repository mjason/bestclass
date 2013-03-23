Bestclass::Application.routes.draw do

  devise_for :users

  resource :users
  resources :courses do
    resources :handouts
    resources :works do
      resources :tasks
    end
  end

  namespace :teacher do
    resources :courses do
      resources :handouts, only: ["create"]
      resources :works do 
        resources :tasks, only: ["update"]
      end
    end
  end

  root to: "users#show"

end
