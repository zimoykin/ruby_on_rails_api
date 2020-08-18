# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :set_person, only: %i[show update]

  def index
    people = Person.all
    render({ json: people, include: :city })
  end

  def show
    render({ json: @person, include: %i[city items] })
  end

  def create
    @new_person = Person.new(person_params)
    if @new_person.save
      render({ json: @new_person, include: :city })
    else
      render({ nothing: true, status: :bad_request })
    end
  end

  def update
    # byebug
    if @person.nil?
      render({ nothing: true, status: :bad_request })
    else
      if @person.update(person_params)
        render({ json: @person, include: :city })
      else
        render({ nothing: true, status: :bad_request })
      end
    end
  end
  # update

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    # byebug
    params.permit(:name, :age, :city_id)
  end
end
