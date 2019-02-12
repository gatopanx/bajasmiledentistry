module Website
  class PostsController < WebsiteController
    def index
      @phones = Phone.where(
        organization: @current_organization,
        phoneable: @current_organization
      )
      @treatments = Item.where(
        organization: @current_organization,
        status: :ACTIVE,
        form: :ABSTRACT,
        primary_kind: :SERVICE
      )
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
    end

    def show
      @phones = Phone.where(
        organization: @current_organization,
        phoneable: @current_organization
      )
      @treatments = Item.where(
        organization: @current_organization,
        status: :ACTIVE,
        form: :ABSTRACT,
        primary_kind: :SERVICE
      )
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
    end
  end
end
