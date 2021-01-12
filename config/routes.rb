Rails.application.routes.draw do
  root "accounts#index"

  resources :accounts do
    resources :students
    resources :contacts
  end
end
