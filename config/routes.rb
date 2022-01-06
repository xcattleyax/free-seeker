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
  resources :posts, only:[:index, :new, :create, :edit, :update] do
    resources :pages, only:[:new, :create, :edit, :update]
    member do
      patch 'release'
    end
    collection do
      get 'list'
      get 'search'
    end
  end

end
