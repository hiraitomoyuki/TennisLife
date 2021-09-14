class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail to: ENV['CONTACT_MAIL'], subject: 'お問い合わせ'
  end
end
