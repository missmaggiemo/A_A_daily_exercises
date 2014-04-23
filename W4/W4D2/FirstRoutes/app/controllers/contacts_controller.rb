class ContactsController < ApplicationController

  def index
    # render :text => "I'm the index! Hear me roar!"
    @contacts = Contact.where(user_id: params[:user_id])
    render :json => @contacts.map { |contact| contact.as_json }

  end

  def show
    contact = Contact.find(params[:id])
    render :json => contact.as_json
  end

  def update
    contact = Contact.find(params[:id])
    contact.update!(contact_params) if contact
    render :json => contact.as_json
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.delete if contact
    render :text => "You have deleted the contact. Yay."
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render :json => contact
    else
      render :json => contact.errors.full_messages, :status => :unprocessable_entity
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :user_id)
    end

end
