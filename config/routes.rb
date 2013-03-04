Bestclass::Application.routes.draw do

  devise_for :users

  resource :users
  resources :courses do
    resources :handouts
    resources :works
  end

  root to: "users#show"

end
