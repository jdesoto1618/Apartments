Rails.application.routes.draw do
  get 'admin/index'
  get 'admin/update'
  get "admin" => "admin#index"
  put "admin/:id" => "admin#update"
  patch "admin/:id" => "admin#update"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # get 'search' => 'apartments#search'
  resources :apartments
  root 'apartments#index'
end
