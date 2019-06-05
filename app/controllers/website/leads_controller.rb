module Website
  class LeadsController < WebsiteController
    before_action :load_phones
    before_action :load_treatments
    before_action :load_items, only: [:new, :edit]

    def new
      @lead = Lead.new
    end

    def create
      @lead = Lead.new(permitted_parameters)
      @lead.source = :WEBSITE
      @lead.save!
      redirect_to controller: :leads, action: :edit, uuid: @lead.uuid
    end

    def edit
      @lead ||= Lead.find_by!(owning_organization: current_organization, uuid: params[:uuid])
    end

    def update_and_confirm_and_send_confirmation_emails
      update
      confirm
      send_confirmation_emails
      redirect_to controller: :leads, action: :thanks, uuid: @lead.uuid
    end

    def thanks
      @lead ||= Lead.find_by!(owning_organization: current_organization, uuid: params[:uuid])
    end

    private

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
        item_ids: []
      )
    end
  end
end
