Rails.application.routes.draw do
  
  root "home#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  
  resources :todos do 
    collection do
      patch :sort
    end
    member do 
      patch :mark_as_done
    end
  end
  resources :todo_types

end
