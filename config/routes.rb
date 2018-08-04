Rails.application.routes.draw do

  root 'home#index'
  
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
  },path: 'users', path_names: { sign_in: 'login' }
end