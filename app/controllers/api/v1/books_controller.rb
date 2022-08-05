class Api::V1::BooksController < ApplicationController
  def index
    books = Book.all
    render json: books
  end
  
  def update
    if book.update(book_params)
      render json: book
    else
      render json: book.errors
    end
  end
  
  def create
    book = Book.create!(name: book_params[:name])
    if book
      image = Image.create!(src: book_params[:image])
      book_image = BookImage.create!(book_id: book.id, image_id: image.id)
      render json: book_image 
    else 
      render json: book.errors
    end
  end

  def destroy
    if book.destroy
      render json: book
    else
      render json: book.errors
    end
  end

  private
  def book_params
    params.require(:books).permit(:name, :image, :user_id)
  end

end
