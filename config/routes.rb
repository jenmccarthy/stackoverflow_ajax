Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root to: 'welcome#index'

  resources :users
  resources :sessions

  resources :questions
  resources :answers

  resources :users do
    resources :questions
  end

end
