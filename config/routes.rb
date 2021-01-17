Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'users/registrations', confirmations: 'users/confirmations' }

  root to: "home#show"
  get '/about', to: 'home#about', as: 'about'
  get '/terms', to: 'home#terms', as: 'terms'
  get '/privacy', to: 'home#privacy', as: 'privacy'
  get '/contact', to: 'contact_messages#new', as: 'contact'

  get '/me', to: 'current_user#show'
  get '/manage', to: 'current_user#manage', as: 'manage'

  resources :books, only: :index do
    resources :clubs, only: [:new, :create]
    resources :subscriptions, only: [:new, :create, :edit, :update]
  end
  resources :clubs, only: :show
  resources :contact_messages, only: :create
  resources :stripe_customer_subscriptions, only: :create
  resources :stripe_webhooks, only: :create
end
