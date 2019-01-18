Rails.application.routes.draw do
  namespace :website, {
      path: '',
      constraints: {
        subdomain: ['', 'www']
    }
  } do
    root 'pages#home', as: :home

    controller :pages do
      get 'get-a-quote'
      get 'contact-us'
    end

    resources :countries, only: [:index, :show] do
      resources :states, only: [:index, :show] do
        resources :cities, only: [:show]
      end
    end

    resources :treatments, only: [:index, :show]
    resources :organizations, only: [:index, :show]
  end
end
