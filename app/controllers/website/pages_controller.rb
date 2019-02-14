module Website
  class PagesController < WebsiteController
    before_action :load_phones
    before_action :load_treatments

    def home
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
      @external_testimonials = Testimonial.where(
        organization: @current_organization,
        status: :ACCEPTED,
        source: :EXTERNAL
      ).order(
        date: :desc
      ).limit(10)
    end

    def contact_us
    end

    def price_list
      @categories = Category.includes(:items).all
    end

    def schedule_appointment_primary
    end

    def schedule_appointment_secondary
    end

    def the_team
      @primary_producer = Person.find_by!(
        organization: @current_organization,
        status: :ACTIVE,
        primary_kind: :PRODUCER,
        name: 'Irving Cota'
      )
      @secondary_producers = Person.where(
        organization: @current_organization,
        status: :ACTIVE,
        primary_kind: :PRODUCER
      ).where.not(
        name: 'Irving Cota'
      )
      @external_testimonials = Testimonial.where(
        organization: @current_organization,
        status: :ACCEPTED,
        source: :EXTERNAL
      ).order(
        date: :desc
      ).limit(10)
    end

    def virtual_tour
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
