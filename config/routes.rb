RFD::Application.routes.draw do
  resources :users, only: [:new, :create]
  resources :places do
    resources :comments, only: :create
  end

  get "sign_up" => "users#new", :as => "sign_up"
  root 'users#new'
end
