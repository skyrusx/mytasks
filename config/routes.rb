Rails.application.routes.draw do
  root 'projects#index'

  resource :todos, only: :create

  resources :projects, only: [:index, :create] do
    resources :todos, only: :update
  end
end
