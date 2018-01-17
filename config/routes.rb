Rails.application.routes.draw do

  get 'profiles/one'
  get 'posts/one'

  get 'prices' => 'prices#index', as: :prices

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
    resources :practitioners
    resources :billable_items
    resources :users do
      member do
        post :resend_invitation
      end
    end
    resources :home_settings
  end
end
