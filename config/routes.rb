Rails.application.routes.draw do

  resources :articles
  devise_for :admins
  resources :admins do
    collection do
      get :companies
    end
  end
  resources :cities
  devise_for :companies, controllers: { confirmations: 'confirmations' }
  resources :companies do
    resources :projects
    member do
      get :help
    end
  end

  root 'main#index'
  get 'how_choose_advertising', to: 'main#important_article'
  get 'main_articles', to: 'main#main_articles'
  get 'agreement', to: 'main#agreement'
  get 'adv_agency/:id', to: 'main#adv_agency', as: 'adv_agency'


end
