Rails.application.routes.draw do
  devise_for :users
  resources :pets
  root 'pets#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
