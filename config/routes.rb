Rails.application.routes.draw do
  root 'articles#index'

  resources :articles

  resource :users, except: [:show, :destroy] do
    collection do
      get :login
      post :logining
    end
  end

  get '/about', to: 'pages#about'
end
