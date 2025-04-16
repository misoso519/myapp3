class ContactMailer < ApplicationMailer
  default from: 'noreply@example.com'

  def send_contact(name, email, message)
    @name = name
    @message = message
    mail(to: ENV['GMAIL_ADDRESS'], subject: 'お問い合わせがありました', reply_to: email)
  end
end
