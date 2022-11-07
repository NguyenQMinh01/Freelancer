class PagesController < ApplicationController
  def home
  end

  def search
    @categories = Category.all
    @category =  Category.find(params[:category]) if  params[:category].present?
    # @gigs = Gig.where("active = ? AND title ILIKE ? AND category_id = ?", true, "%#{params[:t]}%", params[:category]) 
     
    @title = params[:title]
    @min = params[:min]
    @max = params[:max]
    @delivery = params[:delivery].present? ? params[:delivery] : "0"
    @sort = params[:sort].present? ? params[:sort] : "price asc"

    query_condition =  Array.new()
    query_condition[0] = "gigs.active = true "

    if !@title.blank?
      query_condition[0] += "AND gigs.title ILIKE ? "
      query_condition << "%#{@title}%"
    end

    if !params[:category].blank?
      query_condition[0] += "AND category_id = ? "
      query_condition << params[:category]
    end

    if !params[:min].blank?
      query_condition[0] += "AND pricings.price >= ? "
      query_condition << @min
    end

    if !params[:max].blank?
      query_condition[0] += "AND pricings.price <= ? "
      query_condition << @max
    end

    if !params[:delivery].blank? && params[:delivery] != "0"
      query_condition[0] += "AND pricings.delivery_time <= ? "
      query_condition << @delivery
    end
    
    @gigs = Gig.select("gigs.id, gigs.title, gigs.user_id, pricings.price AS price")
            .joins(:pricings).where(query_condition)
            .order(@sort).page(params[:page]).per(6)
  end

end
