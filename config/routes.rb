Rails.application.routes.draw do
  
  resources :todos
  resources :todo_types
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root "home#index"

end
