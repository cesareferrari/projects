Rails.application.routes.draw do
  resources :actions
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:show] do
    resources :projects
  end

  root 'welcome#index'
end
