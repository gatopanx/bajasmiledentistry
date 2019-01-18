module Website
  class PagesController < WebsiteController
    def home
      @before_and_after_sets = [
        OpenStruct.new(
          before: 'holis',
          small_description: 'holis'
        )
      ]
    end

    def get_a_quote
    end

    def contact_us
    end
  end
end
