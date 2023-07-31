Rails.application.routes.draw do
  root 'articles#index'

  resources :payments, only: [:show]
  resources :orders, only: [:index, :show, :create] do
    member do
      get :pay
      patch :please_pay
    end
  end
  # get "/orders/:num/pay", to: 'orders#pay'

  resources :articles do
    member do
      patch :unlock
    end
    resources :comments, only: [:create, :destroy], shallow: true
  end

  resources :albums

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
  get '/pricing', to: 'pages#pricing'
end
