Rails.application.routes.draw do
  # get '/', to: 'articles#index'
  root 'articles#index'

  get '/articles', to: 'articles#index'
  get '/articles/new', to: 'articles#new'
  post '/articles', to: 'articles#create'

  get '/about', to: 'pages#about'
end
