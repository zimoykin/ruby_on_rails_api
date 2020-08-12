class PeopleController < ApplicationController

  def index
    @people = Person.all
    render({:json => @people, :include => :city})
  end

  def show
      @person = Person.find(params[:id])
      render({:json => @person, :include => :city})
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
      @person = Person.find(params[:id])
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

  private def person_params
      #byebug
      params.permit(:name, :age, :city_id)
  end

end
