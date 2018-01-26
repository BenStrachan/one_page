Rails.application.routes.draw do

  get 'prices' => 'prices#index', as: :prices
  resources :posts
  resources :practitioners

  post '/contacts' => 'visitors#contacts', as: :contacts
  get '/contacts/success' => 'visitors#contacts_success', as: :contacts_success
  root 'visitors#index'
  resources :introductions
  resources :careers
  resources :businesses
  devise_for :users, controllers: {
    invitations: 'users/invitations',
  }

  namespace :app, path: 'app' do
    get 'settings' => 'dashboards#settings', as: :settings
    get 'dashboard' => 'dashboards#index', as: :dashboard

    resources :blogs
    resources :practitioners do
      collection do
        post :sync
      end
    end
    resources :billable_items do
      collection do
        post :sync
      end
    end
    resources :users do
      member do
        post :resend_invitation
      end
    end
    resources :home_settings
  end
end
