module Website
  class LeadsController < WebsiteController
    before_action :load_phones
    before_action :load_treatments
    before_action :load_items, only: [:new, :edit]

    def new
      @lead = Lead.new
    end

    def edit
      @lead ||= Lead.find_by!(owning_organization: current_organization, uuid: params[:uuid])
    end

    def create
      @lead = Lead.new(permitted_parameters)
      @lead.source = :WEBSITE
      @lead.save!
      redirect_to controller: :leads, action: :edit, uuid: @lead.uuid
    end

    # TODO: DRY
    def create_and_confirm_and_send_confirmation_emails
      @lead = Lead.new(permitted_parameters)
      @lead.source = :WEBSITE
      @lead.save!
      confirm
      send_confirmation_emails
      create_trello_card
      redirect_to controller: :leads, action: :thanks, uuid: @lead.uuid
    end

    def update_and_confirm_and_send_confirmation_emails
      update
      confirm
      send_confirmation_emails
      create_trello_card
      redirect_to controller: :leads, action: :thanks, uuid: @lead.uuid
    end

    def thanks
      @lead ||= Lead.find_by!(owning_organization: current_organization, uuid: params[:uuid])
    end

    private

    def create_trello_card
      return unless ENV.fetch("SUBMIT_LEADS_TO_TRELLO") == "1"
      @lead ||= Lead.find_by!(owning_organization: current_organization, uuid: params[:uuid])

      description = <<~DESCRIPTION
        Source: Website

        Name: #{@lead.person_name}
        Email: #{@lead.email_address}
        Telephone Number: #{@lead.phone_number}
        Preferred Conversation Channel: #{@lead.preferred_conversation_channel}
        Custom Message: #{@lead.message}
        Preferred Appointment Date: #{@lead.preferred_date.strftime("%A, %B %d, %Y")}
        Preferred Appointment Time Of Day: #{@lead.preferred_time_range}
      DESCRIPTION

      Tacokit.create_card(
        ENV.fetch('TRELLO_LEADS_LIST_ID'),
        "#{@lead.person_name} - Website",
        {
          due: 3.days.from_now.iso8601,
          desc: description,
          pos: 'top'
        }
      )
    end

    def update
      @lead ||= Lead.find_by!(owning_organization: current_organization, uuid: params[:uuid])
      @lead.assign_attributes(permitted_parameters)
      @lead.save!
    end

    def confirm
      @lead ||= Lead.find_by!(owning_organization: current_organization, uuid: params[:uuid])
      @lead.status = :SUBMITTED
      @lead.save!
    end

    def send_confirmation_emails
      @lead ||= Lead.find_by!(owning_organization: current_organization, uuid: params[:uuid])
      Website::LeadsMailer.confirm_external_email(current_organization: current_organization, lead: @lead).deliver_now
      Website::LeadsMailer.confirm_internal_email(current_organization: current_organization, lead: @lead).deliver_now
    end

    def load_items
      @items = Item.where(owning_organization: current_organization, status: :ACTIVE, form: :ABSTRACT, primary_kind: :SERVICE)
    end

    def permitted_parameters
      params.require(:lead).permit(
        :email_address,
        :person_name,
        :phone_country_code,
        :phone_number,
        :preferred_conversation_channel,
        :preferred_date,
        :preferred_time_range,
        :message,
        item_ids: []
      )
    end
  end
end
