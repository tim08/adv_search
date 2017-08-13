Rails.application.routes.draw do
  devise_for :admins
  resources :admins do
    collection do
      get :companies
    end
  end
  resources :cities
  devise_for :companies
  resources :companies

  root 'main#index'


end
