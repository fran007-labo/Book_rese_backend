class Api::V1::ReservationsController < ApplicationController

  def return

    begin
      Reservation.find(params[:id]).update(is_return: true)
      flash_message = "返却が完了しました。"
      flash_status = "success"
      render json: { message: flash_message, status: flash_status }
    rescue
      flash_message = "返却処理が実行できませんでした"
      flash_status = "error"
      render json: { message: flash_message, status: flash_status }
    end
    
  end
end 
