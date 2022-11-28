class MessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    conversation = Conversation.find params[:conversation]
    stream_from conversation
  end
  def speak(data)
    # ActionCable.server.broadcast "room_channel", data["message"]
    Message.create content: data["message"], user: current_user
  end
  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end
end
