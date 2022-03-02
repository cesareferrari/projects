Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:show]

  resources :projects do
    resources :activities
  end

  root 'welcome#index'
end
