Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: "home#show"

  get '/me', to: 'current_user#show'
  resources :books, only: :index do
    resources :subscriptions, only: [:new, :create, :edit, :update]
  end
  resources :stripe_customer_subscriptions, only: :create
end
