class Api::V1::Carts::AddBooksController < Api::V1::Carts::ApplicationController

  def create
    cart = current_user.prepare_cart
    book = Book.find(params[:book_id])

    add_cart = cart.cart_books.build(book_id: book.id)

    if(add_cart.valid?)
      add_cart.save
      flash = { message: "#{book.name}がカートに追加されました。"}
      status = 'success'
    else
      flash = { message: "既に#{book.name}は追加されています。"}
      status = 'fail'
    end

    render json: {
      data: flash
    }, status: status
  end
end 
