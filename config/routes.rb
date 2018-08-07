Rails.application.routes.draw do

  root 'home#index'
  
  #Admin resources
  devise_for :admins, skip: [:registrations], controllers: {
        sessions: 'admins/sessions',
        invitations: 'admins/invitations',
        passwords: 'admins/passwords'
  },path: 'admins', path_names: { sign_in: 'login' }

  devise_scope :admin do 
    get "/admin", to: "admins/sessions#new"       
  end
  
  resources :admins, only: [:edit, :update, :show] do
    member do
      get :dashboard
      get :applications_statistics
    end
    as :admin do 
      get '/edit' => 'admins/registrations#edit', :as => 'edit_registration'    
      put '/update' => 'admins/registrations#update', :as => 'registration'   
    end
  end
  
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
  },path: 'users', path_names: { sign_in: 'login' }
end