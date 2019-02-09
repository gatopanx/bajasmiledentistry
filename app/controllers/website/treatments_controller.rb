module Website
  class TreatmentsController < WebsiteController
    before_action :load_phones
    before_action :load_treatments

    def index
    end

    def show
      @social_proofs = SocialProof.where(
        organization: @current_organization
      )
      @external_testimonials = Testimonial.where(
        organization: @current_organization,
        status: :ACCEPTED,
        source: :EXTERNAL
      ).order(
        date: :desc
      ).limit(10)
      @internal_testimonials = Testimonial.where(
        organization: @current_organization,
        status: :ACCEPTED,
        source: :INTERNAL
      ).order(
        date: :desc
      ).limit(9)

      @treatment = Item.find_by!(key: params[:id].gsub('-', '_'))
    end
  end
end
