Rails.application.routes.draw do
  root 'pages#landing_or_redirect'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'budgets', to: 'pages#budgets', as: 'budgets'
  get 'profile', to: 'pages#profile'
  get 'settings', to: 'pages#settings'
  get 'subscription', to: 'pages#subscription'
  get 'security', to: 'pages#security'
  get 'bank_connect', to: 'pages#bank_connect'
  get 'support', to: 'pages#support'
  get 'pricing', to: 'pages#pricing'
  
  post 'transactions', to: 'pages#create_transaction'
  delete 'transactions/:id', to: 'pages#destroy_transaction', as: 'transaction'
  post 'wallets', to: 'pages#create_wallet', as: 'wallets'
  post 'create_budget', to: 'pages#create_budget', as: 'create_budget'
  get 'export_statement', to: 'pages#export_csv', as: 'export_statement'

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  match 'logout', to: 'sessions#destroy', via: [:get, :delete]
  
  resources :users, only: [:create]
end
