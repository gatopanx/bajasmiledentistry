module Website
  class PagesController < WebsiteController
    def home
      @before_and_after_sets = [
        {
          before: 'https://placehold.it/400x300',
          after: 'https://placehold.it/400x300',
        },
      ].map do |attribute_set|
        OpenStruct.new(attribute_set)
      end
      @clients = [
        {
          name: 'Diego',
          photo: './assets/person1.png',
          testimonial: 'Me gustan las tortugas'
        },
        {
          name: 'Melissa',
          photo: './assets/person2.png',
          testimonial: 'Me gustan las tortugas'
        },
        {
          name: 'Genesis',
          photo: './assets/person3.png',
          testimonial: 'Me gustan las tortugas'
        },
        {
          name: 'Alejandro',
          photo: './assets/person4.png',
          testimonial: 'Me gustan las tortugas'
        },
        {
          name: 'Diego',
          photo: './assets/person1.png',
          testimonial: 'Me gustan las tortugas'
        },
        {
          name: 'Melissa',
          photo: './assets/person2.png',
          testimonial: 'Me gustan las tortugas'
        },
        {
          name: 'Genesis',
          photo: './assets/person3.png',
          testimonial: 'Me gustan las tortugas'
        },
        {
          name: 'Alejandro',
          photo: './assets/person4.png',
          testimonial: 'Me gustan las tortugas'
        },
      ].map do |attribute_set|
        OpenStruct.new(attribute_set)
      end
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
