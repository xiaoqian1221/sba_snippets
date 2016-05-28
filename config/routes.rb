Rails.application.routes.draw do
  devise_for :users
  root 'snippets#index'
  resources :snippets do
    resources :comments, controller: 'snippets/comments'
  end
end
