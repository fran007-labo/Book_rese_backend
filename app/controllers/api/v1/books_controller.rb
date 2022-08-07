class Api::V1::BooksController < Api::V1::Reservations::ApplicationController
  def index
    output = []

    all_books = Book.includes(:images)
    all_books.each do | book |
      book_src = book.images.pluck(:src)
      object = { id: book.id, title: book.name, imageUrl: book_src }
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
    book = Book.create!(book_params)
    
    if book
      image = Image.create!(book_id: book.id, image_params)
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

  def image_params
    params.require(:images).permit(:src)
  end

end
