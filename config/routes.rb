Rails.application.routes.draw do

  resources :promo_requests
  resources :reviews, only: [:new, :create]
  resources :articles
  devise_for :admins
  resources :admins do
    collection do
      get :companies
      get :reviews
      patch 'companies/:id', to: 'admins#change_company_status', as: 'change_company_status'
      patch 'reviews/:id', to: 'admins#change_review_status', as: 'change_review_status'
      delete 'companies/:id', to: 'admins#delete_company', as: 'delete_company'
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
  get 'main_articles/:id', to: 'main#main_article', as: 'main_article'
  get 'agreement', to: 'main#agreement'
  get 'adv_agency/:id', to: 'main#adv_agency', as: 'adv_agency'


end
