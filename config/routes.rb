Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # get 'search' => 'apartments#search'
  resources :apartments
  root 'apartments#index'
end
