class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :update, :destroy]

  def index
    #byebug
    cities = City.all
    render({:json => cities, :include => :people})
  end


  def show
    #byebug
    #render ({ :json => @city, :include => :people )}
    #status: :ok

    render :json => @city,
      :only => [:id, :title, :qpeople],
      :include => {
        :people => {
          :except => [:created_at, :updated_at],
          :include => {
            :items => {
              :only => [:id, :name, :description]
            }
          }
        }
      }

  end


  def create
    #byebug
    new_city = City.new(allowed_params)
    if new_city.save
      render({:json => new_city, :include => :people})
    else
      render({nothing: true, status: :bad_request})
    end
  end


  def update
    #byebug
      if @city.update(allowed_params)
        render({:json => city, :include => :people})
      end
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def allowed_params
    params.permit(:title, :qpeople)
  end

end
