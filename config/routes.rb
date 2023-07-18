Rails.application.routes.draw do
  root 'articles#index'

  resources :articles

  resource :users, except: [:show, :destroy]

  get '/about', to: 'pages#about'
end
