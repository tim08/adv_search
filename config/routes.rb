Rails.application.routes.draw do

  resources :custom_descriptions
  resources :promo_requests
  resources :reviews, only: [:new, :create]
  resources :articles
  devise_for :admins
  resources :admins do
    collection do
      get :companies
      get :reviews
      patch 'companies/:id', to: 'admins#change_company_status', as: 'change_company_status'
      patch 'promo_requests/:id', to: 'admins#change_request_status', as: 'change_request_status'
      patch 'reviews/:id', to: 'admins#change_review_status', as: 'change_review_status'
      patch 'articles/:id', to: 'admins#change_article_status', as: 'change_article_status'
      delete 'companies/:id', to: 'admins#delete_company', as: 'delete_company'
    end
  end
  resources :cities

  devise_for :companies, controllers: { confirmations: 'confirmations',
                                        registrations: 'companies/registrations'}
  resources :companies do
    resources :projects
    resources :articles, controller: 'company_articles'
    member do
      get :payment
      post :payment_redirect
      get :statistics
      get :help
      get :promo_requests
      patch 'accept_promo_request/:promo_request_id', action: :accept_promo_request, as: 'accept_promo_request'
      patch 'close_promo_request/:promo_request_id', action: :close_promo_request, as: 'close_promo_request'
    end
  end

  root 'main#index'
  get 'how_choose_advertising', to: 'main#important_article'
  get 'main_articles', to: 'main#main_articles'
  get 'main_articles/:id', to: 'main#main_article', as: 'main_article'
  get 'agreement', to: 'main#agreement'
  get 'main_promo_requests', to: 'main#main_promo_requests'
  get 'adv_agency/:id', to: 'main#adv_agency', as: 'adv_agency'

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  match "/422", :to => "errors#unprocessable_entity", :via => :all


end
