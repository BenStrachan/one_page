Rails.application.routes.draw do
  root 'visitors#index'
  get 'price' => 'visitors#price', as: :pricing
  resources :introductions
  resources :careers
  resources :businesses
  resources :blogs
  devise_for :users, controllers: {
    invitations: 'users/invitations',
  }

  namespace :app, path: 'app' do
    get 'settings' => 'dashboards#settings', as: :settings
    get 'dashboard' => 'dashboards#index', as: :dashboard

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
