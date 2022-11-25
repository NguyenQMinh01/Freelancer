class MessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    conversation = Conversation.find params[:conversation]
    stream_from conversation
  end

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end
end
