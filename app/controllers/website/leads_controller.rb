module Website
  class LeadsController < WebsiteController
    before_action :load_phones
    before_action :load_treatments

    def new
      @lead = Lead.new
      @items = Item.where(owning_organization: current_organization, status: :ACTIVE, form: :ABSTRACT, primary_kind: :SERVICE)
    end

    def edit
      @lead = Lead.find_by!(owning_organization: current_organization, uuid: params[:id])
      @items = Item.where(owning_organization: current_organization, status: :ACTIVE, form: :ABSTRACT, primary_kind: :SERVICE)
    end

    def create
      lead = Lead.new(permitted_parameters)
      lead.source = :WEBSITE
      lead.status = :DRAFT
      lead.save!

      redirect_to controller: :leads, action: :get_content, id: lead.uuid
    end

    def update
      @lead = Lead.find_by!(owning_organization: current_organization, uuid: params[:id])
    end


    def confirm
      @lead = Lead.find_by!(
        owning_organization: current_organization,
        uuid: params[:id]
      )
      lead.status = :SUBMITTED
      lead.save!

      # TODO: Hook outgoing email

      redirect_to controller: :leads, action: :get_confirm, id: lead.uuid
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
