class ContactShareController < ApplicationController

  def create
    if ContactShare.check_contact_info_against_user_info(contact_share_params[:contact_id], contact_share_params[:user_id])
      contact_share = ContactShare.new(contact_share_params)
      if contact_share.save
        render :json => contact_share
      else
        render :json => contact_share.errors.full_messages, :status => :unprocessable_entity
      end
    else
      render :json => contact_share.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def destroy
    contact_share = ContactShare.find(params[:id])
    contact_share.delete if contact_share
    render :text => "You have deleted your shared contact!"
  end

  private

  def contact_share_params
    params.require(:contact_share).permit(:user_id, :contact_id)
  end

end
