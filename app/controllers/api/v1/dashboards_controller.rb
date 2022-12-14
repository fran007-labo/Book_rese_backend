class Api::V1::DashboardsController < ApplicationController
  def index
    output = []

    reservations = Reservation.all.includes(:user)

    if (!reservations)
      return render json: { message: '現在予約された本はありません' }
    end

    reservations.each do |reservation|
      user_name   = reservation.user.name
      book_title  = reservation.book.title
      book_img    = reservation.book.images.pluck(:src)[0]
      start_date  = reservation.start_date
      return_date = reservation.return_date
      is_return   = reservation.is_return

      object = {
        userName: user_name,
        bookTitle: book_title,
        bookImg: book_img,
        startDate: start_date,
        returnDate: return_date,
        isReturn: is_return
      }

      output.append(object)
    end

    render json: output

  end

  # dashboard/user/:id
  def show 
    output = []

    user_reservations = Reservation.where(user_id: current_user.id).includes(:book)

    user_reservations.each do |reservation|
      reserved_id = reservation.id
      reserved_book_name = reservation.book.title
      reserved_book_img = reservation.book.images.pluck(:src)[0]
      start_date = reservation.start_date
      return_date = reservation.return_date
      is_return = reservation.is_return

      object = {
        reservedId: reserved_id,
        reservedBookName: reserved_book_name,
        reservedBookImg: reserved_book_img,
        startDate: start_date,
        returnDate: return_date,
        isReturn: is_return
      }

      output.append(object)
    end

    render json: output
  end
end