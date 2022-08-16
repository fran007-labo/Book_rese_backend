class Api::V1::Carts::AddBooksController < Api::V1::Carts::ApplicationController

  def create
    cart = current_user.prepare_cart
    book = Book.find(params[:book_id])

    add_cart = cart.cart_books.build(book_id: book.id)

    if(add_cart.valid?)
      add_cart.save
      flash = "#{book.title}がカートに追加されました。"
      status = 'success'
    else
      flash = "既に#{book.title}はカートに追加されています。"
      status = 'error'
    end

    render json: {
      message: flash,
      status: status
    }
  end
end 
