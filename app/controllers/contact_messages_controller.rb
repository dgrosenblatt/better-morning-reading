class ContactMessagesController < ApplicationController
  def new
    @contact_message = ContactMessage.new
  end

  def create
    @contact_message = ContactMessage.new(contact_message_params)

    if @contact_message.save
      redirect_to root_path, notice: 'Your message has been sent. Thank you for contacting us.'
    else
      render :new
    end
  end

  private

  def contact_message_params
    params.require(:contact_message).permit(:reply_email, :message)
  end
end
