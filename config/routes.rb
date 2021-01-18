Rails.application.routes.draw do
  root 'projects#index'

  resources :projects, only: :index do
    resources :todos, only: [:create, :update]
  end
end
