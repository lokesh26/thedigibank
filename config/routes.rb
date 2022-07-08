Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'accounts#show', as: 'root'
  namespace :accounts do
    resources :transactions, only: %i[new create] do
      get :sent, on: :collection
      get :received, on: :collection    
    end
  end

  get '*path', to: 'accounts#unknown'
end
