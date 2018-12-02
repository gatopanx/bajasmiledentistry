Rails.application.routes.draw do
  namespace :website, {
      path: '',
      constraints: {
        subdomain: ['', 'www']
    }
  } do

    root 'pages#home'

    controller :pages do
      get 'about-us'
      get 'contact-us'
      get 'price-list'
      get 'schedule-appointment-primary'
      get 'schedule-appointment-secondary'
      get 'the-team'
      get 'virtual-tour'
    end

    resources :pictures, only: [:index]
    resources :posts, only: [:index, :show]
    resources :treatments, only: [:index, :show]
  end
end
