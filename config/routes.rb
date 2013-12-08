DaFrack::Application.routes.draw do
  resources :wells do
    resources :reports, shallow: true
  end

  get "home/index"
  devise_for :users

  root to: "home#index"
end
