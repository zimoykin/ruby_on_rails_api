class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  def index
    @items = Item.all
    render json: @items
  end

  def show
    #json.extract! @item, :id, :name, :description, :picture, :created_at, :updated_at
    render json: @item
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description , :picture)
    end

end
