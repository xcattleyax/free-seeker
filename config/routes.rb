Rails.application.routes.draw do

  devise_for :users
  root to: 'tops#index'
  resources :groups do
    resources :messages, only:[:index, :create]
    member do
      get 'home'
      patch 'addition'
    end
  end
  resources :posts, only:[:new, :create] do
    resources :pages, only:[:new, :create]
  end

end
