class WebsiteController < ApplicationController
  protect_from_forgery with: :exception
  layout 'website/layouts/application'

  protected

  def load_phones
    @phones = Phone.where(
      owning_organization: current_organization,
      phoneable: @current_organization
    )
  end

  def load_treatments
    @treatments = Item.where(
      owning_organization: current_organization,
      status: :ACTIVE,
      form: :ABSTRACT,
      primary_kind: :SERVICE
    )
  end
end
