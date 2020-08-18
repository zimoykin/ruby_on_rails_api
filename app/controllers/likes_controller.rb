class LikesController < ApplicationController

  def index
    likes = Like.all
    render json: likes
  end

  def show
    like = Like.find(params[:id])
    render json: like
  end

  def create

    puts (@current_user.email)

    like = Like.new(allowed_params)
    like.user_id = @current_user.id

    if like.save
      render json: like, status: :ok
    else
      render nothing: true, status: :bad_request
    end

  end


  private

  def allowed_params
    params.permit(:item_id)
  end
end
