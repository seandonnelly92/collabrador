class MessagesController < ApplicationController

  def create
    # content, chatroom, user
    @message = Message.new(message_params)
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message.chatroom = @chatroom
    @message.user = current_user

    @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(
          partial: "messages/message",
          locals: { message: @message }
        )
      )
      head :ok # don't send a view, don't redirect
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
