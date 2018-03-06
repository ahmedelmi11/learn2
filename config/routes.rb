Rails.application.routes.draw do
  get 'ticket_technologies/create'

  devise_for :users
  root to: 'pages#home'

  resources :tickets, except: [:destroy] do
    resources :ticket_technologies, only: [ :create ]
  end
  resources :ticket_technologies, only:[ :create ]
end
