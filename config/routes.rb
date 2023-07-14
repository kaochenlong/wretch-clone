Rails.application.routes.draw do
  root 'articles#index'

  resources :articles

  get '/about', to: 'pages#about'
end
