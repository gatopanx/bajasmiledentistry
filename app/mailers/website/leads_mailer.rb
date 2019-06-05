module Website
  class LeadsMailer < WebsiteMailer
    def confirm_external_email(current_organization:,lead:)
      @current_organization = current_organization
      @lead = lead

      mail({
        to: lead.email_address,
        subject: "Thanks for your appointment #{lead.person_name}"
      })
    end

    def confirm_internal_email(current_organization:, lead:)
      @current_organization = current_organization
      @lead = lead

      mail({
        to: ENV.fetch('SUPPORT_EMAIL_ADDRESS'),
        subject: "New Lead: #{lead.person_name}"
      })
    end
  end
end
