class ContactsController < ApplicationController
  def create
    name = params[:name]
    email = params[:email]
    message = params[:message]

    ContactMailer.send_contact(name, email, message).deliver_now

    flash[:notice] = "お問い合わせを送信しました"
    redirect_to contact_path
  end
end
