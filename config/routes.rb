Rails.application.routes.draw do
  root "accounts#index"

  resources :accounts do
    resources :students
  end
end
