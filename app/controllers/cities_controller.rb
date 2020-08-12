class CitiesController < ApplicationController

  def index
    #byebug
    cities = City.all
    render({:json => cities, :include => :people})
  end


  def show
      city = City.find(params[:id])
      render({:json => city, :include => :people})
  end


  def create
    new_city = City.new(city_params)
    if new_city.save
      render({:json => new_city, :include => :people})
    else
      render({nothing: true, status: :bad_request})
    end
  end


  # def update
  #   @city = City.find (params[:id])
  #   unless @city.nil?
  #     if @city.update(city_params)
  #         render :json => @city, :include => :people
  #     else
  #         render :nothing => true, :status => :bad_request
  #     end
  #   else
  #     render :nothing => true, :status => :bad_request
  #   end
  # end

  def update
    #byebug
      city = City.find (params[:id])
      if city.update(allowed_params)
        render({:json => city, :include => :people})
      end
  end

  def allowed_params
    params.permit(:title, :qpeople)
  end

end
