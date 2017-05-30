Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolio_items do
    put :sort, on: :collection
  end
  resources :blogs do 
  	member do
  		get :toggle_status
  	end	
  end	
  get 'about-me',  to: 'pages#about'  
  get 'contact',   to: 'pages#contact'  
  get 'tech-news', to: 'pages#tech_news'  
  
  # create web socket connection
  mount ActionCable.server => '/cable'

  root to: 'pages#home'
end
