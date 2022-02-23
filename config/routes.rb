Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
