# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact
     contact = Contact.new(title: "event", content: "楽しいよ！")

     ContactMailer.send_mail(contact)
  end
end
