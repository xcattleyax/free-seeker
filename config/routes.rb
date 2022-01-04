Rails.application.routes.draw do

  devise_for :users
  root to: 'tops#index'
  resources :groups, except:[:delete] do
    resources :messages, only:[:index, :create]
    member do
      get 'home'
      patch 'addition'
    end
  end

end
