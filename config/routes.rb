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
    resources :add_user_favorite_books, only: :create
  end
  resources :pause_subscriptions, only: :update
  resources :resume_subscriptions, only: :update
  resources :on_demand_send_subscriptions, only: :update
  resources :remove_user_favorite_books, only: :destroy
  resource :reading_list, only: :show
  resources :clubs, only: [:show, :index, :edit, :update] do
    resources :club_memberships, only: :create, as: 'memberships'
  end
  resources :start_clubs, only: [:update]
  resources :contact_messages, only: :create
  resources :stripe_customer_subscriptions, only: :create
  resources :stripe_webhooks, only: :create
end
