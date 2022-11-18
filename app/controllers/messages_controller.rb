class MessagesController < ApplicationController
  def create
    if current_user.id == message_params[:receiver_id]
      redirect_to request.referrer, alert: "Cannot send message to yourself"
    end
  
    
  conversation = Conversation.where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)",
                                  current_user.id, message_params[:receiver_id], message_params[:receiver_id], current_user.id ).first
  
  conversation = Conversation.create(sender_id: current_user.id, receiver_id: message_params[:receiver_id]) if !conversation.present?


  @message = Message.new(user_id: current_user.id, conversation_id: conversation.id, content: message_params[:content])
  
  if @message.save
    redirect_to request.referrer, notice: "Message sent succcess"
  else
    redirect_to redirect_to request.referrer, notice: "Cannot sent the message"
  end

end

  private
  def message_params
    params.require(:message).permit(:content, :receiver_id)
  end
end
