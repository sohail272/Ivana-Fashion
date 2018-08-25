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
  
  #User resources
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
  },path: 'users', path_names: { sign_in: 'login' }

  # resources :users, only: [] do
  #   resources :applications, except: [:index, :destroy], controller: 'users/applications' do
  #     collection do
  #       get :terms_and_conditions
  #       get :privacy_notice
  #       get :calculate_plan_cost
  #     end 

  #     member do 
  #       get :thank_you
  #       get :manual_screening
  #       get :email_proposal
  #       get :payment
  #       get :generate_quotation
  #       patch :upload_payment_slip
  #       get :application_details
  #       get :download_slip
  #     end
  #   end

  #   member do
  #     get :dashboard
  #     get :invalid_action
  #   end
  # end


  #get "/products", to: 'products#index', as: 'products'

  resources :products, only: [:index], path: '/products' do
    collection do
      
    end
  end
  #resources :enquiries, only: :create
  match '/products/:id' => 'products#show', as: 'product', via: [:get, :post]
  get 'home/cart'
  get 'home/checkout'



  # Home Controller
  get '/about-us', to: 'home#about_us', as: 'about_us'
  get '/contact-us', to: 'home#contact_us', as: 'contact_us'
  # get '/terms-of-use', to: 'home#terms_of_use', as: 'terms-of-use'
  # get '/privacy-notice', to: 'home#privacy_notice', as: 'privacy-notice'

  # resources :home, only: [:index] do
  #   collection do
  #     get :get_quote
  #   end
  # end
end