Rails.application.routes.draw do
  devise_for :users

  root to: "home#show"

  get '/me', to: 'current_user#show'
end
