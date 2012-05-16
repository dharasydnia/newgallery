Newgallery::Application.routes.draw do  
  resources :galleries do
    member do
     post 'rate'
    end
  end   
  resources :users do
   member do
     post 'rate'
    end
  end
   
  match 'user/edit' => 'users#edit', :as => :edit_current_user

  match 'signup' => 'users#new', :as => :signup

  match 'logout' => 'sessions#destroy', :as => :logout

  match 'login' => 'sessions#new', :as => :login

  resources :sessions

  resources :users

  resources :images
  
  resources :galleries
  
  root to: 'galleries#index'
  
  resources :galleries do
    resources :images
  end
end
