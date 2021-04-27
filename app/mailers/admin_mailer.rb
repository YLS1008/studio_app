class AdminMailer < ApplicationMailer

  def new_contact(contact)
    @contact = contact

    mail to: ENV['admin1_mail'], ENV['admin2_mail'], ENV['admin3_mail']], subject: "New Contact"
  end
end
