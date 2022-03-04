Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:show]

  post 'done_activities/:id', to: "done_activities#create", as: :done_activities
  delete 'done_activities/:id', to: "done_activities#destroy", as: :done_activity

  resources :projects do
    resources :activities
  end

  root 'welcome#index'
end
