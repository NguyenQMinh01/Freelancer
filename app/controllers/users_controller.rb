class UsersController < ApplicationController
  before_action :authenticate_user!
  def dashboard
    @gig = Gig.where("gigs.user_id = ?", current_user.id).page(params[:page]).per(6)
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(seller_id: params[:id]).order("created_at DESC")
  end

  def update 
    @user = current_user
    if @user.update(current_user_params)
      flash[:notice] =  "Saved Success"
    else
      flash[:alert] = "Cannot update"
    end
    redirect_to dashboard_path
  end

  private
  def current_user_params
    params.require(:user).permit(:from, :about, :status, :language, :avatar)
  end 
  
end 



