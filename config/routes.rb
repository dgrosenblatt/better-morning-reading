Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'users/registrations', confirmations: 'users/confirmations' }

  root to: "home#show"

  get '/me', to: 'current_user#show'
  get '/manage', to: 'current_user#manage', as: 'manage'

  resources :books, only: :index do
    resources :subscriptions, only: [:new, :create, :edit, :update]
  end
  resources :stripe_customer_subscriptions, only: :create
  resources :stripe_webhooks, only: :create
end
