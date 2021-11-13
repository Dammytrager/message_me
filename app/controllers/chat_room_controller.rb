class ChatRoomController < ApplicationController

  before_action :require_login

  def index
    @messages = Message.all.includes(:user)
    @message = Message.new
  end

end
