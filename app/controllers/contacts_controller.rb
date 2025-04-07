class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to root_path, notice: "Your message was sent successfully!" }
        format.json { render json: { status: :ok, message: "Message sent successfully" } }
      else
        format.html { redirect_to root_path, alert: "Error: #{@contact.errors.full_messages.join(', ')}" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
