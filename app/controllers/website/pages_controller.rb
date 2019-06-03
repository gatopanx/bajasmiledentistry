module Website
  class PagesController < WebsiteController
    before_action :load_phones
    before_action :load_treatments

    def home
      @social_proofs = SocialProof.where(
        owning_organization: @current_organization
      )
      @external_testimonials = Testimonial.where(
        owning_organization: @current_organization,
        status: :ACCEPTED,
        source: :EXTERNAL
      ).order(
        date: :desc
      ).limit(10)
      @internal_testimonials = Testimonial.where(
        owning_organization: @current_organization,
        status: :ACCEPTED,
        source: :INTERNAL
      ).order(
        date: :desc
      ).limit(9)
    end

    def about_us
      @external_testimonials = Testimonial.where(
        owning_organization: @current_organization,
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

    def the_team
      @primary_producers = Person.where(
        owning_organization: @current_organization,
        status: :ACTIVE,
        primary_kind: :PRODUCER,
      )
      .where(
        name: [
          'Irving Cota',
          'Marcia Bustamante',
          'Aldo Sanchez'
        ]
      )
      @secondary_producers = Person.where(
        owning_organization: @current_organization,
        status: :ACTIVE,
        primary_kind: :PRODUCER
      ).where.not(
        name: [
          'Irving Cota',
          'Marcia Bustamante',
          'Aldo Sanchez'
        ]
      )
      @external_testimonials = Testimonial.where(
        owning_organization: @current_organization,
        status: :ACCEPTED,
        source: :EXTERNAL
      ).order(
        date: :desc
      ).limit(10)
    end

    def virtual_tour
      @social_proofs = SocialProof.where(
        owning_organization: @current_organization
      )
      @external_testimonials = Testimonial.where(
        owning_organization: @current_organization,
        status: :ACCEPTED,
        source: :EXTERNAL
      ).order(
        date: :desc
      ).limit(10)
      @internal_testimonials = Testimonial.where(
        owning_organization: @current_organization,
        status: :ACCEPTED,
        source: :INTERNAL
      ).order(
        date: :desc
      ).limit(9)
    end
  end
end
