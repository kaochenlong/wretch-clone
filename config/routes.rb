Rails.application.routes.draw do
  root 'articles#index'

  resources :articles

  resource :users, except: [:show, :destroy] do
    collection do
      get :login
      post :logining
      delete :logout
    end
  end

  get '/about', to: 'pages#about'
end
