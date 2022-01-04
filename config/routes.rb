Rails.application.routes.draw do

  devise_for :users
  root to: 'tops#index'
  resources :groups, only:[:index, :new, :create, :show, :update] do
    resources :messages, only:[:index, :create]
  end

end
