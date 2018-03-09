Rails.application.routes.draw do
  get 'ticket_technologies/create'

  devise_for :users
  root to: 'pages#home'

  resources :tickets, except: [:destroy] do
    resources :ticket_technologies, only: [ :create ]
    patch 'accept_ticket', to: "tickets#accept_ticket", as: :accept_ticket
    patch 'mark_ticket_finished', to: "tickets#mark_ticket_finished", as: :mark_ticket_finished
    resources :comments, only: [:create]
  end

  resources :users, only: [:edit, :show, :update] do
  resources :user_technologies, only: [:new, :create, :destroy]
  end

  get 'dashboard', to: 'pages#dashboard', as: :dashboard
end
