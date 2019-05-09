Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords"}
  root 'home#index'
  get 'home/index', to: 'home#index'

  get 'pages/about'

  get 'pages/blog'

  get 'pages/contact'

  get 'pages/services'

  get 'pages/work'

  get 'pages/work-grid'

  get 'pages/work-grid-without-text'

  get 'pages/test'

  resources :posts do
    collection do
      get :myposts
    end

    member do
      get :add_like
      get :delete_like
    end
  end
end
