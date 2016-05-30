Rails.application.routes.draw do
  root 'snippets#index'

  devise_for :users

  resources :snippets do
    resources :comments
  end
  
end
