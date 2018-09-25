class WebsiteController < ApplicationController
  protect_from_forgery with: :exception
  layout 'website/layouts/application'
end
