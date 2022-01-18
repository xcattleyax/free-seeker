Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations'}
  root to: 'tops#index'
  resources :tops, only:[:new]
  resources :groups do
    resources :messages, only:[:index, :create]
    member do
      get 'home'
      patch 'addition'
    end
  end
  resources :scadules
  resources :posts, except:[:destroy] do
    resources :pages, only:[:new, :create, :show, :edit, :update]
    member do
      patch 'release'
    end
    collection do
      get 'list'
      get 'search'
    end
    resources :comments, only:[:new, :create]
  end
  resources :comments, only:[:index, :show]
  resources :answers, only:[:create]
end
