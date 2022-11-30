class OffersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_offer, except: [:create]
    before_action :set_offer, only: [:accept, :reject]
    before_action :is_authorized, only: [:accept, :reject]

    def create
        req = Request.find(offer_params[:request_id])

        if req && req.user_id == current_user.id
            redirect_to request_path(req), alert: "You can't offer your own request"
            return
        end

        if Offer.exists?(user_id: current_user.id, request_id: offer_params[:request_id])
            redirect_to request_path(req), alert: "You can make only one offerat the moment"
            return
        end

        @offer = current_user.offers.build(offer_params)
        if @offer.save
            # redirect_to controller: 'requests', action: 'list' , notice: "Offer was successfully"
            redirect_to my_offers_path, notice: "Save success"
        else
            redirect_to request_path(req) , alert: @offer.errors.full_messages.join(', ')
        end

    end

    def accept
        if @offer.pending?
            @offer.accepted! #set @offer.status = 1

            if charge(@offer.request, @offer)
            flash[:notice] = "Accepted"
            else
                flash[:alert] = "Cannot create your order"
            end
        end
        redirect_to request.referrer
    end


    def reject
        if @offer.pending?
            @offer.rejected! #set @offer.status = 2
            flash[:notice] = "Rejected"
        end
        redirect_to request.referrer
    end


    private

    def charge(req, offer)
        order = req.orders.new 
        order.due_date = Date.today() + offer.days
        order.title = req.title
        order.seller_name = offer.user.full_name
        order.seller_id = offer.user.id
        order.gig_id = offer.request.id
        order.buyer_name = current_user.full_name
        order.buyer_id = current_user.id
        order.amount = offer.amount
        order.save
    end

    def set_offer
        @offer = Offer.find(params[:id])
    end

    def is_authorized 
        redirect_to root_path, alert: "You don't have permission" unless current_user.id == @offer.request.user_id
    end

    def offer_params
        params.require(:offer).permit(:amount, :days, :note, :request_id, :status) 
    end
end