class Api::V1::CheckOutsController < ApplicationController

  def create
    cart = current_user.prepare_cart
    books = cart.books.ids

    begin
      books.each do | id |
        Reservation.create!(
          book_id: id, 
          user_id: current_user.id, 
          start_date: params[:start_date],
          return_date: params[:return_date]
        )
      end
      flash_message = "本の予約が完了しました。"
      flash_status = 'success'
      cart.destroy!
    rescue => e 
      flash_message = "本の予約に失敗しました。"
      flash_status = 'error'
    end

    render json: {
      message: flash_message,
      status: flash_status
    }
  end
end
