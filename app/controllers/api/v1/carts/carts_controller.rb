class Api::V1::Carts::CartsController < Api::V1::Carts::ApplicationController
  def show
    cart = current_user.prepare_cart
    books = cart.books

    render json: books
  end
end