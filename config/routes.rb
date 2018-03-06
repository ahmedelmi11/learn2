Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :tickets, except: [:destroy]
end
