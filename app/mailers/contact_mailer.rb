class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.thanks.subject
  #
  def thanks(contact)
    @contact = contact

    mail to: contact.email, subject: "The Studio - Contacts "
  end
end
