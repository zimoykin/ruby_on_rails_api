# frozen_string_literal: true

class CitiesController < ApplicationController
  before_action :set_city, only: %i[show update destroy]

  def index
    # byebug
    cities = City.all.order(qpeople: :desc)
    render json: cities,
           only: %i[id title qpeople],
           include: {
             people: {
               except: %i[created_at updated_at],
               include: {
                 items: {
                   only: %i[id name description]
                 }
               }
             }
           },
           status: :ok
  end

  def show
    render json: @city, only: %i[id title qpeople], include: { people: { except: %i[created_at updated_at], include: { items: {only: %i[id name description]}}}},
           status: :ok
  end

  def create
    # byebug
    new_city = City.new(allowed_params)
    if new_city.save
      render({ json: new_city, except: %i[created_at updated_at], status: :ok })
    else
      render({ nothing: true, status: :bad_request })
    end
  end

  def update
    # byebug
    if @city.update(allowed_params)
      render({ json: @city, except: %i[created_at updated_at], include: :people,
               status: :ok })
    end
  end

  def destroy
    if @city.destroy
      render({ json: @city, except: %i[created_at updated_at], include: :people,
               status: :ok })
    else
      render({ nothing: true, status: :bad_request })
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
