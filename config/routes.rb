Boardapp::Application.routes.draw do
  resources :statuses


  devise_for :users

  root :to => 'home#index'
end
