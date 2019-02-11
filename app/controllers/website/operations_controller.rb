module Website
  class OperationsController < WebsiteController
    def schedule
      params.require(
        [
          :name,
          :email,
          :phone,
          :date
        ]
      )

      ActiveRecord::Base.transaction do
        person = Person.create!(
          first_name: params.fetch(:name),
          last_name: 'Last Name',
        )

      end
      binding.pry

      head :ok
    end
  end
end
