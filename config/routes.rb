Rails.application.routes.draw do
  resources :portfolio_items, except: [:show]
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
