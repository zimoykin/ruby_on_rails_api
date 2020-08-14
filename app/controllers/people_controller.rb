class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :update]

  def index
    people = Person.all
    render({:json => people, :include => :city})
  end

  def show
      render({:json => @person, :include => [:city, :items]})
  end

  def create
    @new_person = Person.new(person_params)
    if @new_person.save
      render({:json => @new_person, :include => :city})
    else
      render({nothing: true, status: :bad_request})
    end
  end

  def update
      #byebug
      unless @person.nil?
        if @person.update(person_params)
            render({:json => @person, :include => :city})
        else
          render({nothing: true, status: :bad_request})
        end
      else
          render({nothing: true, status: :bad_request})
      end
  end
  #update

  def destroy
     @person = Person.find(params[:id])
     @person.destroy
  end

  private

  def set_person
     @person = Person.find(params[:id])
  end

  def person_params
      #byebug
      params.permit(:name, :age, :city_id)
  end

end
