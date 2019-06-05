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

    resources :leads, only: [:new, :create, :edit], param: :uuid do
      collection do
        post :create_and_confirm_and_send_confirmation_emails
      end
      member do
        patch :update_and_confirm_and_send_confirmation_emails
        get :thanks
      end
    end
    resources :posts, only: [:index, :show]
    resources :treatments, only: [:index, :show]
  end
end
