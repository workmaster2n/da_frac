DaFrack::Application.routes.draw do
  resources :reports

  get "home/index"
  devise_for :users

  root to: "home#index"
end
