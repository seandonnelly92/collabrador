class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Chatroom.find(params[:id])
    # stream_for chatroom makes a unique string for each ID, for the chatroom related to the page your on
    stream_for chatroom

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
