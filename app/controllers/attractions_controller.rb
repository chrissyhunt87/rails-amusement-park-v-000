class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @current_user = current_user
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new
  end

  def new
    if current_user.admin
      @attraction = Attraction.new
    else
      redirect_to root_path
    end
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def edit
    if current_user.admin
      @attraction = Attraction.find_by(id: params[:id])
    else
      redirect_to attractions_path
    end
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
