class CommentsController < ApplicationController
    before_action :authenticate_user! 
    before_action :is_valid_order

    def create
        order = Order.find(comment_params[:order_id])

        return redirect_to request.referrer, alert: "Invalid message" if comment_params[:content].blank?
        
        @comment = Comment.new( user_id: current_user.id, order_id: order.id, content: comment_params[:content])

        if @comment.save
            redirect_to request.referrer, notice: "Comments sent success"
        else
            redirect_to request.referrer, alert: "Cannot sent comment"
        end
    end



    private 
    def comment_params 
        params.require(:comment).permit(:content, :order_id) 
    end


    def is_valid_order
        redirect_to dashboard_path, alert: "Invalid order" unless Order.find(comment_params[:order_id]).present?
    end
end