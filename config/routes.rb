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
      get 'the-team'
      get 'virtual-tour'
    end

    resources :leads, only: [:new, :create] do
      collection do
        get   :context,   action: :get_context
        post  :context,   action: :post_context
      end
      member do
        get   :confirm,   action: :get_confirm
        post  :confirm,   action: :post_confirm
      end
    end
    resources :posts, only: [:index, :show]
    resources :treatments, only: [:index, :show]
  end
end
