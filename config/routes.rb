Boardapp::Application.routes.draw do
  resources :statuses

  authenticated :user do
    root :to => 'statuses#index'
  end


  devise_for :users

  root :to => 'home#index'
end
