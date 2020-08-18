class BooksController < ApplicationController
  before_action :set_book, only: [:show, :download]

  def index
    @books = Book.all
    render json: @books
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book
    else
      render({nothing: true, status: :bad_request})
    end
  end



  private
  def book_params
    params.permit(:title, :description, :image, :author)
  end

  def set_book
    @book = Book.find(params[:id])
  end


end
