class WebsiteMailer < ApplicationMailer
  default from: ENV.fetch('SUPPORT_EMAIL_ADDRESS')
  layout 'website/layouts/mailer'
end
