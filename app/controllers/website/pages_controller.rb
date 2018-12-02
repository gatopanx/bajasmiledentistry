module Website
  class PagesController < WebsiteController
    def home
      @phones = Phone.where(
        organization: @current_organization,
        phoneable: @current_organization
      )
      @treatments = Item.where(
        organization: @current_organization,
        status: :ACTIVE,
        form: :ABSTRACT,
        primary_kind: :SERVICE,
        secondary_kind: :SERVICE_TREATMENT
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

    def about_us
    end

    def contact_us
    end

    def price_list
    end

    def schedule_appointment_primary
    end

    def schedule_appointment_secondary
    end

    def the_team
    end

    def virtual_tour
    end
  end
end
