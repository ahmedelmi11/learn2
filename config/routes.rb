Rails.application.routes.draw do
  get 'ticket_technologies/create'

  devise_for :users
  root to: 'pages#home'

  resources :tickets, except: [:destroy] do
    resources :ticket_technologies, only: [ :create ]
    get 'accept_ticket', to: "tickets#accept_ticket", as: :accept_ticket
  end

  resources :users, only: [:edit, :show, :update] do
  end
  resources :user_technologies, only: [:new, :create, :destroy]

end
