Rails.application.routes.draw do
  root 'welcome#index'
  get 'dashboard', to: 'dashboard#show', as: :dashboard  
  post 'login', to: 'sessions#create', as: :login
end
