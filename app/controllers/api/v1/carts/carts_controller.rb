class Api::V1::Carts::CartsController < Api::V1::Carts::ApplicationController
  def index
    output = []

    cart = current_user.prepare_cart
    books = cart.books
    images = Image.where(book_id: books)
    
    books.zip(images) do |book, image|
      
      object = {
        id: book.id, 
        title: book.title, 
        author: book.author,
        body: book.body,
        imageUrl: image.src.identifier,
        publisher: book.publisher 
      }
      output.append(object)
    end

    render json: output
  end
end