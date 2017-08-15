Rails.application.routes.draw do

  devise_for :admins
  resources :admins do
    collection do
      get :companies
    end
  end
  resources :cities
  devise_for :companies
  resources :companies do
    resources :projects
  end

  root 'main#index'
  get 'how_choose_advertising', to: 'main#important_article'
  get 'articles', to: 'main#articles'


end
