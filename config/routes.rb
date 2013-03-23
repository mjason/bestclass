Bestclass::Application.routes.draw do

  devise_for :users

  resource :users
  resources :courses do
    resources :handouts do
      get 'download'
      get 'swf'
    end
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
