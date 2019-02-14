Rails.application.routes.draw do
  # TODO - Move this under website namespace
  namespace :admin do
    resources :addresses
    resources :attachments
    resources :authentications
    resources :categories
    resources :emails
    resources :images
    resources :items
    resources :item_lead_mappings
    resources :item_testimonial_mappings
    resources :leads
    resources :organizations

    resources :people

    resources :phones
    resources :social_proofs
    resources :testimonials
  end

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

    controller :operations do
      post :schedule
    end

    # resources :pictures, only: [:index]
    resources :posts, only: [:index, :show]
    resources :treatments, only: [:index, :show]
  end
end
