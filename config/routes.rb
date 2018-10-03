Rails.application.routes.draw do

  # 1 - homepage (video, contact form, press bar, testimonials, facilities, location, etc)
  # 1.1 - photos
  # 1.2 - treatments (collection)
  #   1.2.1 - dental implants (member)
  #   1.2.2 - dentures/veeners (member)
  #   1.2.3 - crowns (member)
  #   1.2.4 - restorations (member)
  #   1.2.5 - root canal (member)
  #   1.2.6 - teeth whitening (member)
  # 1.3 - price list / quote system
  # 1.4 - virtual tour (route trip video, border pass, shuttle, map, facilities, malls, hotels)
  # 1.5 - our team
  # 1.6 - about us (history, our difference, affiliations, press)
  # 1.7 - blog
  # 1.8 - schedule appointment
  # 1.9 - contact us
  namespace :website, {
      path: '',
      constraints: {
        subdomain: ['', 'www']
    }
  } do
    root 'pages#home', as: :home

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
