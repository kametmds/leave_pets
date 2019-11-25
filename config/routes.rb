Rails.application.routes.draw do
  devise_for :users
  get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :pets
  resources :spaces
  root 'spaces#index'
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :conversations do
    resources :messages
  end
end
