module Website
  class PagesController < WebsiteController
    def home
      @before_and_after_sets = [
        {
          before: 'holder.js/1280x720?auto=yes',
          after: 'holder.js/1280x720?auto=yes',
          small_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.',
          big_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.'
        },
        {
          before: 'holder.js/1280x720?auto=yes',
          after: 'holder.js/1280x720?auto=yes',
          small_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.',
          big_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.'
        },
        {
          before: 'holder.js/1280x720?auto=yes',
          after: 'holder.js/1280x720?auto=yes',
          small_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.',
          big_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.'
        },
        {
          before: 'holder.js/1280x720?auto=yes',
          after: 'holder.js/1280x720?auto=yes',
          small_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.',
          big_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.'
        },
        {
          before: 'holder.js/1280x720?auto=yes',
          after: 'holder.js/1280x720?auto=yes',
          small_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.',
          big_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.'
        },
        {
          before: 'holder.js/1280x720?auto=yes',
          after: 'holder.js/1280x720?auto=yes',
          small_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.',
          big_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.'
        },
        {
          before: 'holder.js/1280x720?auto=yes',
          after: 'holder.js/1280x720?auto=yes',
          small_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.',
          big_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.'
        },
        {
          before: 'holder.js/1280x720?auto=yes',
          after: 'holder.js/1280x720?auto=yes',
          small_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.',
          big_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.'
        },
        {
          before: 'holder.js/1280x720?auto=yes',
          after: 'holder.js/1280x720?auto=yes',
          small_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.',
          big_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.'
        },
        {
          before: 'holder.js/1280x720?auto=yes',
          after: 'holder.js/1280x720?auto=yes',
          small_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.',
          big_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.'
        },
        {
          before: 'holder.js/1280x720?auto=yes',
          after: 'holder.js/1280x720?auto=yes',
          small_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.',
          big_description: 'Ellen W. visits us from Arizona to get a Teeth Whitening on August 2018, this is the  before and after more info.'
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
