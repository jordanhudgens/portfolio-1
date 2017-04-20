Rails.application.routes.draw do
  resources :portfolio_items
  resources :blogs

  get 'about-me', to: 'pages#about'  # otvara na /about-me url-u
  get 'contact', to: 'pages#contact'  # otvara na /contact url-u
  
  root to: 'pages#home'

end
