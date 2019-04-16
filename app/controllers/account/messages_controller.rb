class Account::MessagesController < ApplicationController

  before_action :redirect_if_not_logged, only: :create

  def index
    @messages = Message.where(user_id: current_user.id).includes(:post)
  end

  def create
    @message = Message.new(messages_params)
    if @message.save
      redirect_to listings_path
    end
  end


  private

  def messages_params
    params.require(:message).permit(
        :content,
        :post_id
    ).merge(user_id: current_user.id)
  end

  def redirect_if_not_logged
    redirect_to new_user_registration_path unless current_user
  end

end
