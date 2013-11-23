RFD::Application.routes.draw do
  resources :users, only: [:new, :create]
  resources :places do
    resources :comments, only: :create
  end

  # Session
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  post 'sessions' => "sessions#create", as: 'sessions'

  # Sign Up
  get "sign_up" => "users#new", :as => "sign_up"

  root 'users#new'
end
