Rails.application.routes.draw do
  root 'articles#index'

  resources :articles do
    resources :comments, only: [:create, :destroy], shallow: true
  end

  resource :users, except: [:show, :destroy] do
    collection do
      get :login
      post :logining
      delete :logout
    end
  end

  namespace :api do
    namespace :v1 do
      resources :articles, only: [] do
        member do
          patch :like
        end
      end
    end
  end

  get '/about', to: 'pages#about'
end
