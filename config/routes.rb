DaFrack::Application.routes.draw do
  resources :wells do
    collection do
      post :import
    end
    resources :reports, shallow: true
    resources :stages, shallow: true
  end

  get "home/index"
  devise_for :users

  root to: "home#index"
end
