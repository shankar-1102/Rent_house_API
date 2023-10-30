Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  namespace :api do 
    namespace :v1 do 
      resources :houses do 
        resources :feedbacks 
        # resource :checkouts, only: [:create]
        post '/checkout', to: "checkouts#create"
      end  
      resources :users
    end 
  end 


end
