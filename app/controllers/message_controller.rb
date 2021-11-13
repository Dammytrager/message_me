class MessageController < ApplicationController

  before_action :require_login

  def create
    @message = current_user.messages.build(message_params)

    if @message.save
      ActionCable.server.broadcast 'chatroom_channel', { body: message_renderer }
    else
      set_error(message: @message.errors&.full_messages&.first)
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_renderer
    render(partial: 'messages/message', locals: { message: @message })
  end

end
