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
    
    binding.pry
    
    book = Book.create!(book_params)

    if book
      image = Image.create!(book_id: book.id, src: params[:images][0][:path])
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
  def book_params
    params.require(:books).permit(:title, :author, :publisher, :body).merge(user_id: current_user.id)
  end

  # def image_params
  #   params.require(:images).permit(:src)
  # end

end
