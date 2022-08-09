class Api::V1::Reservations::AddBooksController < Api::V1::Reservations::ApplicationController

  def create
    reservation = current_user.prepare_reservation
    book  = Book.find(params[:book_id])
    check = reservation.new(book_id: book).valid?(:add_books)
    if check && check.save
      render status: 200
    else 
      render status: 400
    end
  end

  private 
  def add_books_parameter

  end
end 
