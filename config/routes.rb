Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolio_items, except: [:show] do
    put :sort, on: :collection
  end

  get 'portfolio_item/:id', to: 'portfolio_items#show', as: 'portfolio_item_show'
  get 'angular-items', to: "portfolio_items#angular"

  resources :blogs do 
  	member do
  		get :toggle_status
  	end	
  end	

  get 'about-me', to: 'pages#about'  # otvara na /about-me url-u
  get 'contact', to: 'pages#contact'  # otvara na /contact url-u
  
  root to: 'pages#home'

end
