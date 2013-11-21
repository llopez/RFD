RFD::Application.routes.draw do
  resources :places do
    resources :comments, only: :create
  end
  root 'places#index'
end
