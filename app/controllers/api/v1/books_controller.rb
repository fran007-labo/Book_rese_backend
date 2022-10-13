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
    book = Book.create!(stings_data_params)
    if book
      if params[:images].present?
        image = Image.new(book_id: book.id, src: params[:images][0])
        image.save
      end
      flash_message = "本の登録が完了しました。"
      flash_status = 'success'
    else
      flash_message = "必須項目を入力して下さい"
      flash_status = 'error'
    end

    render json: {
      message: flash_message,
      status: flash_status
    }
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
