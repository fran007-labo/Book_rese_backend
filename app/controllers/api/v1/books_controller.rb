class Api::V1::BooksController < ApplicationController
  skip_before_action :authenticate_user, only: [:index]

  def index
    output = []

    all_books = Book.includes(:images)
    all_books.each do | book |
      book_src = book.images.pluck(:src)
      object = {
        id: book.id, 
        title: book.title, 
        author: book.author,
        body: book.body,
        imageUrl: book_src,
        publisher: book.publisher 
      }

      output.append(object)
    end

    render json: output
  end
  
  def update
    if book.update(book_params)
      render json: book
    else
      render json: book.errors
    end
  end
  
  def create
    book = Book.new(stings_data_params)
    if book.save
      # image = Image.create!(book_id: book.id, src: params[:images][0][:path])
      image = Image.new(book_id: book.id, src: params[:images])
      image.save
      head 200
    else
      head 404
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
  def stings_data_params
    params.require(:stringsData).permit(:title, :author, :publisher, :body).merge(user_id: current_user.id)
  end

  def image_params
    params.require(:images)
  end

end
