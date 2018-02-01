Rails.application.routes.draw do
  devise_for :users
  namespace(:admin) do
    resources :downloads do
      collection { put "sort" }
    end
    resources :categories do
      collection { put "sort" }
      resources :topics do
        collection { put "sort" }
        resources :messages
      end
    end
    resources :topics do
      collection { put "sort" }
      resources :messages
    end
    resources :users do
      collection { put "sort" }
      resources :messages
    end
  end

  resources :documents, only: [:show]
  resources :images   , only: [:show]
  resources :assets   , only: [:show]
  resources :pages    , only: [:index, :show], as: :koi_pages
  root to: 'application#index'
  mount Koi::Engine => "/admin", as: "koi_engine"

  resources :categories, path: 'forum', only: [:index, :show] do
    resources :topics
  end
  resources :topic, path: 'topic' do
    resources :messages do
      get 'rate'
      get 'reply'
      get 'view_replies'
    end
  end
  resources :downloads , path: 'downloads' , only: [:index, :show]

  #must be at bottom
  get "/:id"  => "pages#show", as: :page
end
